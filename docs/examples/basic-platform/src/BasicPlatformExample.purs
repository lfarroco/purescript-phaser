module Main where

import Prelude
import Data.Array ((..))
import Data.Foldable (for_)
import Data.Int (toNumber)
import Data.Maybe (Maybe(..))
import Data.Traversable (sequence)
import Effect (Effect)
import Effect.Class.Console (log)
import Graphics.Phaser as Phaser
import Graphics.Phaser.ArcadePhysics as P
import Graphics.Phaser.CoreTypes (class PhysicsEnabled)
import Graphics.Phaser.Events (createEventListener0, getEventEmitter, on)
import Graphics.Phaser.ForeignTypes (ArcadeImage, ArcadeSprite, PhaserScene)
import Graphics.Phaser.GameObject as GO
import Graphics.Phaser.Image as Image
import Graphics.Phaser.Input (CursorKeys, createCursorKeys, isDown)
import Graphics.Phaser.Loader as Loader
import Graphics.Phaser.Scene (getChildByName, getPhysicsPlugin)
import Graphics.Phaser.SceneManager (Start(..), addScene)
import Graphics.Phaser.Sprite (class Sprite)
import Graphics.Phaser.Sprite as Sprite
--import Option (fromRecord)


-- !! TODO !! replace Option with https://github.com/purescript-contrib/purescript-options/blob/main/src/Data/Options.purs

-- Adapted from http://labs.phaser.io/edit.html?src=src/physics/arcade/basic%20platform.js
main :: Effect Unit
main =
  void do
    game <-
      Phaser.create
        { width: 800.0
        , height: 600.0
        , physics:
            fromRecord
              { default: "arcade"
              , arcade:
                  fromRecord { gravity: fromRecord { y: 300.0 }, debug: false }
              }
        }
    addScene "scene 1" { create, preload } Start game

preload :: PhaserScene -> Effect Unit
preload scene =
  for_ [ "sky", "platform", "star" ] \key ->
    do
      Loader.loadImage { key, path: basePath <> key <> ".png" } scene
      >>= Loader.loadSpritesheet { key: "dude", path: basePath <> "dude.png" }
          { frameWidth: 32.0
          , frameHeight: 48.0
          }
  where
  basePath = "https://raw.githubusercontent.com/photonstorm/phaser3-examples/master/public/src/games/firstgame/assets/"

create :: PhaserScene -> Effect Unit
create scene =
  void do
    phy <- getPhysicsPlugin scene
    createBg
    platformsGroup <- P.createStaticGroup phy
    createFloor platformsGroup
    movingPlatform <- createPlatform phy
    player <- createPlayer phy
    stars <- createStars phy
    cursors <- createCursorKeys scene
    void $ createAnimations
    void $ setupCollisions player stars platformsGroup movingPlatform phy
    getEventEmitter scene
      >>= on "update" (createEventListener0 (update cursors scene))
  where
  setupCollisions player stars platformsGroup movingPlatform =
    P.addCollider player platformsGroup
      >=> P.addCollider player movingPlatform
      >=> P.addCollider stars movingPlatform
      >=> P.addCollider stars platformsGroup
      >=> P.addOverlap player stars collectStar

  createAnimations = do
    leftWalkFrames <- Sprite.generateFrameNumbers "dude" 0 3 scene
    rightWalkFrames <- Sprite.generateFrameNumbers "dude" 5 8 scene
    void $ Sprite.createAnimation "left" leftWalkFrames 10.0 (-1) scene
    void $ Sprite.createAnimation "turn" [ { key: "dude", frame: 4 } ] 10.0 (-1) scene
    void $ Sprite.createAnimation "right" rightWalkFrames 10.0 (-1) scene

  createBg =
    void do
      Image.create "sky" scene
        >>= GO.setPosition { x: 400.0, y: 300.0 }

  createFloor group =
    void do
      P.createChild { x: 400.0, y: 568.0 } "platform" group
        >>= GO.setScale { x: 2.0, y: 2.0 }
        >>= P.refreshBody

  createPlatform phy =
    P.createArcadeImage { x: 400.0, y: 400.0 } "platform" phy
      >>= P.setImmovable true
      >>= P.setAllowGravity false
      >>= P.setVelocityX 50.0
      >>= GO.setName "moving_platform"

  createPlayer phy =
    P.createArcadeSprite { x: 50.0, y: 500.0 } "dude" phy
      >>= P.setBounce 0.4
      >>= P.setCollideWorldBounds true
      >>= GO.setName "player"

  createStars phy = do
    starsEff <-
      map
        ( \n ->
            do
              P.createArcadeImage { x: 50.0 + (toNumber n * 40.0), y: 100.0 } "star" phy
              >>= P.setBounce 0.4
              >>= P.setCollideWorldBounds true
        )
        (1 .. 15)
        # sequence
    pure starsEff

update :: CursorKeys -> PhaserScene -> Effect Unit
update cursors scene =
  void do
    movePlayer
    movePlatform
  where
  movePlayer = do
    player <- getPlayer scene
    case player of
      Just sprite ->
        void do
          touching <- P.getTouching sprite
          isUp <- isDown cursors.up
          move cursors sprite
          if isUp && touching.down then
            jump sprite
          else
            pure sprite
      Nothing -> log "Sprite not found!"
    where
    jump = P.setVelocityY (-350.0)

  movePlatform = do
    platform <- getPlatform scene
    case platform of
      Just img -> do
        x <- GO.getX img
        if x >= 500.0 then
          void $ P.setVelocityX (-50.0) img
        else
          pure unit
        if x <= 300.0 then
          void $ P.setVelocityX (50.0) img
        else
          pure unit
      Nothing -> log "Platform image not found!"

move :: forall a. PhysicsEnabled a => Sprite a => CursorKeys -> a -> Effect Unit
move cursors sprite =
  void do
    isRight <- isDown cursors.right
    isLeft <- isDown cursors.left
    if isRight then
      moveRight
    else if isLeft then
      moveLeft
    else
      stop
  where
  moveRight = P.setVelocityX (150.0) sprite >>= Sprite.playAnimation { key: "right", ignoreIfPlaying: true }

  moveLeft = P.setVelocityX (-150.0) sprite >>= Sprite.playAnimation { key: "left", ignoreIfPlaying: true }

  stop = P.setVelocityX 0.0 sprite >>= Sprite.playAnimation { key: "turn", ignoreIfPlaying: false }

getPlayer :: PhaserScene -> Effect (Maybe ArcadeSprite)
getPlayer scene = getChildByName "player" scene

getPlatform :: PhaserScene -> Effect (Maybe ArcadeImage)
getPlatform scene = getChildByName "moving_platform" scene

collectStar :: ArcadeSprite -> ArcadeImage -> Effect Unit
collectStar _a b = P.disableBody b >>= const (pure unit)
