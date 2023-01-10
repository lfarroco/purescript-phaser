module Main where

import Prelude
import Data.Array ((..))
import Data.Foldable (for_)
import Data.Int (toNumber)
import Data.Maybe (Maybe(..))
import Data.Traversable (sequence)
import Effect (Effect)
import Effect.Class.Console (log)
import Effect.Console as Console
import Graphics.Phaser (config, createWithConfig, physicsConfig)
import Graphics.Phaser.ArcadePhysics as ArcadePhysics
import Graphics.Phaser.CoreTypes (class PhysicsEnabled)
import Graphics.Phaser.ForeignTypes (ArcadeImage, ArcadeSprite, PhaserGame, PhaserScene)
import Graphics.Phaser.GameObject as GO
import Graphics.Phaser.Image as Image
import Graphics.Phaser.Input.InputPlugin as Input
import Graphics.Phaser.Loader as Loader
import Graphics.Phaser.Scene as Scene
import Graphics.Phaser.Sprite (class Sprite, createAnimation, generateFrameNumbers, playAnimation)

-- Adapted from http://labs.phaser.io/edit.html?src=src/physics/arcade/basic%20platform.js
main :: Effect PhaserGame
main = do
  scene <- mainScene
  createWithConfig
    ( config.width 800.0
        <> (config.height 600.0)
        <> (config.scene [ scene ]) -- The first scene in the array is started by default
        <> (config.physics physicsConfig')
    )
  where
  physicsConfig' =
    physicsConfig.default "arcade"
      <> (physicsConfig.arcade { debug: false, gravity: { x: 0.0, y: 100.0 } })

mainScene :: Effect PhaserScene
mainScene =
  Scene.newScene "main"
    >>= Scene.create oncreate
    >>= Scene.preload onpreload

onpreload :: PhaserScene -> Effect Unit
onpreload scene =
  for_ [ "sky", "platform", "star" ] \key ->
    do
      Loader.loadImage { key, path: basePath <> key <> ".png" } scene
      >>= Loader.loadSpritesheet { key: "dude", path: basePath <> "dude.png" }
          { frameWidth: 32.0
          , frameHeight: 48.0
          }
  where
  basePath = "https://raw.githubusercontent.com/photonstorm/phaser3-examples/master/public/src/games/firstgame/assets/"

oncreate :: PhaserScene -> Effect Unit
oncreate scene =
  void do
    physics <- Scene.getPhysicsPlugin scene
    createBg
    platformsGroup <- ArcadePhysics.createStaticGroup physics
    createFloor platformsGroup
    movingPlatform <- createPlatform physics
    player <- createPlayer physics
    stars <- createStars physics
    cursors <- Input.createCursorKeys scene
    createAnimations
    void $ setupCollisions player stars platformsGroup movingPlatform physics
    Scene.update (update cursors) scene
  where
  setupCollisions player stars platformsGroup movingPlatform =
    ArcadePhysics.addCollider player platformsGroup
      >=> ArcadePhysics.addCollider player movingPlatform
      >=> ArcadePhysics.addCollider stars movingPlatform
      >=> ArcadePhysics.addCollider stars platformsGroup
      >=> ArcadePhysics.addOverlap player stars collectStar

  createAnimations =
    void do
      leftWalkFrames <- generateFrameNumbers "dude" 0 3 scene
      rightWalkFrames <- generateFrameNumbers "dude" 5 8 scene
      void $ createAnimation "left" leftWalkFrames 10.0 (-1) scene
      void $ createAnimation "turn" [ { key: "dude", frame: 4 } ] 10.0 (-1) scene
      void $ createAnimation "right" rightWalkFrames 10.0 (-1) scene

  createBg =
    void do
      Image.create "sky" scene
        >>= GO.setPosition { x: 400.0, y: 300.0 }

  createFloor group =
    void do
      ArcadePhysics.createChild { x: 400.0, y: 568.0 } "platform" group
        >>= GO.setScale { x: 2.0, y: 2.0 }
        >>= ArcadePhysics.refreshBody

  createPlatform physics =
    ArcadePhysics.createArcadeImage { x: 400.0, y: 400.0 } "platform" physics
      >>= ArcadePhysics.setImmovable true
      >>= ArcadePhysics.setAllowGravity false
      >>= ArcadePhysics.setVelocityX 50.0
      >>= GO.setName "moving_platform"

  createPlayer physics =
    ArcadePhysics.createArcadeSprite { x: 50.0, y: 500.0 } "dude" physics
      >>= ArcadePhysics.setBounce 0.4
      >>= ArcadePhysics.setCollideWorldBounds true
      >>= GO.setName "player"

  createStars physics =
    map
      ( \n ->
          ArcadePhysics.createArcadeImage { x: 50.0 + (toNumber n * 40.0), y: 100.0 } "star" physics
            >>= ArcadePhysics.setBounce 0.4
            >>= ArcadePhysics.setCollideWorldBounds true
      )
      (1 .. 15)
      # sequence

update :: Input.CursorKeys -> PhaserScene -> Effect Unit
update cursors scene = do
  movePlayer
  movePlatform
  where
  movePlayer = do
    player <- getPlayer scene
    case player of
      Just sprite ->
        void do
          touching <- ArcadePhysics.getTouching sprite
          isUp <- Input.isDown cursors.up
          move cursors sprite
          if isUp && touching.down then
            jump sprite
          else
            pure sprite
      Nothing -> log "Sprite not found!"
    where
    jump = ArcadePhysics.setVelocityY (-350.0)

  movePlatform = do
    platform <- getPlatform scene
    case platform of
      Just img -> do
        x <- GO.getX img
        when (x >= 500.0) (void $ ArcadePhysics.setVelocityX (-50.0) img)
        when (x <= 300.0) (void $ ArcadePhysics.setVelocityX (50.0) img)
      Nothing -> Console.error "Platform image not found!"

move :: forall a. PhysicsEnabled a => Sprite a => Input.CursorKeys -> a -> Effect Unit
move cursors sprite =
  void do
    isRight <- Input.isDown cursors.right
    isLeft <- Input.isDown cursors.left
    if isRight then
      moveRight
    else if isLeft then
      moveLeft
    else
      stop
  where
  moveRight =
    ArcadePhysics.setVelocityX (150.0) sprite
      >>= playAnimation { key: "right", ignoreIfPlaying: true }

  moveLeft =
    ArcadePhysics.setVelocityX (-150.0) sprite
      >>= playAnimation { key: "left", ignoreIfPlaying: true }

  stop =
    ArcadePhysics.setVelocityX 0.0 sprite
      >>= playAnimation { key: "turn", ignoreIfPlaying: false }

getPlayer :: PhaserScene -> Effect (Maybe ArcadeSprite)
getPlayer scene = Scene.getChildByName "player" scene

getPlatform :: PhaserScene -> Effect (Maybe ArcadeImage)
getPlatform scene = Scene.getChildByName "moving_platform" scene

collectStar :: ArcadeSprite -> ArcadeImage -> Effect Unit
collectStar _a b = ArcadePhysics.disableBody b >>= const (pure unit)
