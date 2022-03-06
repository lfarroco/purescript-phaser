module Main where

import Prelude

import Data.Foldable (for_)
import Data.Maybe (Maybe)
import Effect (Effect)
import Graphics.Phaser as Phaser
import Graphics.Phaser.ForeignTypes (PhaserScene)
import Graphics.Phaser.GameObject (class GameObject)
import Graphics.Phaser.GameObject as GO
import Graphics.Phaser.Loader (loadSpritesheet)
import Graphics.Phaser.SceneManager (Start(..), addScene)
import Graphics.Phaser.Sprite as Sprite

-- | Adapted from https://phaser.io/examples/v3/view/loader/sprite-sheet/load-sprite-sheet
ghRoot :: String
ghRoot = "https://raw.githubusercontent.com/photonstorm/phaser3-examples/master/public/assets/sprites/"

preload :: PhaserScene -> Effect Unit
preload scene =
  void do
    for_
      [ loadSpritesheet "explosion" (ghRoot <> "explosion.png")
          { frameWidth: 64.0
          , frameHeight: 64.0
          , startFrame: 0
          , endFrame: 23
          , margin: 0
          , spacing: 0
          }
      , loadSpritesheet "balls" (ghRoot <> "balls.png")
          { frameWidth: 17.0
          , frameHeight: 17.0
          , startFrame: 0
          , endFrame: 4
          , margin: 0
          , spacing: 0
          }
      ] \fn -> fn scene

main :: Effect (Maybe PhaserScene)
main =
  Phaser.create { width: 250.0, height: 250.0 }
    >>= addScene "main" { create, preload } Start

explodeSpriteKey :: String
explodeSpriteKey = "explosion"

explodeAnimationKey :: String
explodeAnimationKey = "explodeAnimation"

scale :: forall a. GameObject a => a -> Effect a
scale = GO.setScale ({ x: 3.0, y: 3.0 })

create :: PhaserScene -> Effect Unit
create scene =
  void do
    explosionFrames <- Sprite.generateFrameNumbers explodeSpriteKey 0 23 scene
    _ <- Sprite.createAnimation explodeAnimationKey explosionFrames 20.0 (-1) scene
    _ <-
      Sprite.add explodeSpriteKey { x: 100.0, y: 100.0 } scene
        >>= Sprite.playAnimation explodeAnimationKey
        >>= scale
    Sprite.add
      "balls"
      { x: 100.0, y: 100.0 }
      scene
      >>= Sprite.setFrame 3
      >>= scale
