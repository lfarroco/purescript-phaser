module Main where

import Prelude
import Data.Foldable (for_)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Class.Console (log)
import Graphics.Phaser as Phaser
import Graphics.Phaser.ArcadePhysics as P
import Graphics.Phaser.CoreTypes (class PhysicsEnabled, ArcadeImage, ArcadeSprite, StaticGroup)
import Graphics.Phaser.ForeignTypes (PhaserImage, PhaserScene)
import Graphics.Phaser.GameObject as GO
import Graphics.Phaser.Image as Image
import Graphics.Phaser.Input (CursorKeys, createCursorKeys, isDown)
import Graphics.Phaser.Loader as Loader
import Graphics.Phaser.Scene (getChildByName)
import Graphics.Phaser.SceneManager (Start(..), addScene)
import Graphics.Phaser.Sprite (class Sprite)
import Graphics.Phaser.Sprite as Sprite
import Option (fromRecord)

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
    addScene "scene 1" { create, preload, update } Start game

basePath :: String
basePath = "http://labs.phaser.io/src/games/firstgame/assets/"

preload :: PhaserScene -> Effect Unit
preload scene =
  for_ [ "sky", "platform", "star" ] \key -> do
    void $ Loader.loadImage { key, path: basePath <> key <> ".png" } scene
    void
      $ Loader.loadSpritesheet "dude" (basePath <> "dude.png")
          { frameWidth: 32.0
          , frameHeight: 48.0
          , startFrame: 0
          , endFrame: 8
          , margin: 0
          , spacing: 0
          }
          scene

create :: PhaserScene -> Effect Unit
create scene = do
  _bg <- createBg scene
  --
  platforms <- P.createStaticGroup scene
  _ground <- createGround platforms
  --
  movingPlatform <- createPlatform scene
  --
  player <- createPlayer scene
  createAnimations scene
  void $ P.addCollider player platforms scene
  void
    $ P.addCollider player movingPlatform scene
  pure unit

createAnimations :: PhaserScene -> Effect Unit
createAnimations scene = do
  leftWalkFrames <- Sprite.generateFrameNumbers "dude" 0 3 scene
  rightWalkFrames <- Sprite.generateFrameNumbers "dude" 5 8 scene
  void $ Sprite.createAnimation "left" leftWalkFrames 10.0 (-1) scene
  void $ Sprite.createAnimation "turn" [ { key: "dude", frame: 4 } ] 10.0 (-1) scene
  void $ Sprite.createAnimation "right" rightWalkFrames 10.0 (-1) scene

createBg :: PhaserScene -> Effect PhaserImage
createBg =
  Image.create "sky"
    >=> GO.setPosition { x: 400.0, y: 300.0 }

createGround :: StaticGroup -> Effect ArcadeSprite
createGround group =
  P.createChild { x: 400.0, y: 568.0 } "platform" group
    >>= GO.setScale { x: 2.0, y: 2.0 }
    >>= P.refreshBody

createPlatform :: PhaserScene -> Effect ArcadeImage
createPlatform scene =
  P.createArcadeImage { x: 400.0, y: 400.0 } "platform" scene
    >>= P.setImmovable true
    >>= P.setAllowGravity false
    >>= P.setVelocityX 50.0

createPlayer :: PhaserScene -> Effect ArcadeSprite
createPlayer scene =
  P.createArcadeSprite { x: 50.0, y: 500.0 } "dude" scene
    >>= P.setBounce 0.2
    >>= P.setCollideWorldBounds true
    >>= GO.setName "player"

update :: PhaserScene -> Effect Unit
update scene = do
  -- TODO: add the input plugin to other entities, so that that this
  -- can be created outside the update loop
  cursors <- createCursorKeys scene
  player <- getPlayer scene
  case player of
    Just sprite ->
      void do
        touching <- P.getTouching sprite
        isUp' <- isDown cursors.up
        void $ move cursors sprite
        if isUp' && touching.down then
          jump sprite
        else
          pure sprite
    Nothing -> log "Sprite not found!"

move :: forall a. PhysicsEnabled a => Sprite a => CursorKeys -> a -> Effect a
move cursors sprite = do
  isRight' <- isDown cursors.right
  isLeft' <- isDown cursors.left
  if isRight' then
    moveRight sprite
  else if isLeft' then
    moveLeft sprite
  else
    stop sprite

moveRight :: forall a. PhysicsEnabled a => Sprite a => a -> Effect a
moveRight = P.setVelocityX (150.0) >=> Sprite.playAnimation {key: "right", ignoreIfPlaying: true}

moveLeft :: forall a. PhysicsEnabled a => Sprite a => a -> Effect a
moveLeft = P.setVelocityX (-150.0) >=> Sprite.playAnimation {key: "left", ignoreIfPlaying: true}

jump :: forall a. PhysicsEnabled a => Sprite a => a -> Effect a
jump = P.setVelocityY (-350.0)

stop :: forall a. PhysicsEnabled a => Sprite a => a -> Effect a
stop = P.setVelocityX 0.0 >=> Sprite.playAnimation {key: "turn", ignoreIfPlaying: false}

getPlayer :: PhaserScene -> Effect (Maybe ArcadeSprite)
getPlayer scene = getChildByName "player" scene
