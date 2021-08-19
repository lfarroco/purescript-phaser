module Main where

import Prelude
import Effect (Effect)
import Graphics.Phaser (addScene)
import Graphics.Phaser as Phaser
import Graphics.Phaser.GameObject (Dimensions)
import Graphics.Phaser.Loader (loadSpritesheet)
import Graphics.Phaser.Scene (SceneConfig, defaultSceneConfig)
import Graphics.Phaser.Sprite as Sprite
import Phaser.Graphics.ForeignTypes (PhaserGame, PhaserScene)

-- | Adapted from https://phaser.io/examples/v3/view/loader/sprite-sheet/load-sprite-sheet
ghRoot = "https://raw.githubusercontent.com/photonstorm/phaser3-examples/master/public/assets/sprites/"

preload :: PhaserScene -> Effect Unit
preload scene = do
  _ <-
    loadSpritesheet "explosion" (ghRoot <> "explosion.png")
      { frameWidth: 64.0
      , frameHeight: 64.0
      , startFrame: 0
      , endFrame: 23
      , margin: 0
      , spacing: 0
      }
      scene
  _ <-
    loadSpritesheet "balls" (ghRoot <> "balls.png")
      { frameWidth: 17.0
      , frameHeight: 17.0
      , startFrame: 0
      , endFrame: 4
      , margin: 0
      , spacing: 0
      }
      scene
  pure unit

main :: Effect PhaserGame
main = do
  runGame { width: 800, height: 600 }

runGame :: Dimensions -> Effect PhaserGame
runGame =
  Phaser.create
    >=> addScene mainScene true

explodeSpriteKey = "explosion"

explodeAnimationKey = "explodeAnimation"

create :: forall st. PhaserScene -> st -> Effect Unit
create scene _state = do
  explosionFrames <- Sprite.generateFrameNumbers explodeSpriteKey 0 23 scene
  _ <- Sprite.createAnimation explodeAnimationKey explosionFrames 20.0 (-1) scene
  _ <-
    Sprite.add explodeSpriteKey { x: 100.0, y: 100.0 } scene
      >>= Sprite.playAnimation explodeAnimationKey
  _ <-
    Sprite.add "balls" { x: 100.0, y: 100.0 } scene
      >>= Sprite.setFrame 3
  pure unit

mainScene :: SceneConfig {}
mainScene =
  defaultSceneConfig
    { key = "main"
    , create = create
    , preload = preload
    }
