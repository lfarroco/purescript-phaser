module Main where

import Prelude
import Effect (Effect)
import Graphics.Phaser (addScene)
import Graphics.Phaser as Phaser
import Graphics.Phaser.Scene (SceneConfig, defaultSceneConfig)
import Graphics.Phaser.GameObject (Dimensions, setAlpha)
import Graphics.Phaser.Loader (loadSpritesheet)
import Graphics.Phaser.Sprite as Sprite
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserScene)
import Graphics.Phaser.Graphics as Graphics
import Graphics.Phaser.Container as Container


main :: Effect PhaserGame
main = do
  runGame { width: 800, height: 600 }

runGame :: Dimensions -> Effect PhaserGame
runGame =
  Phaser.create
    >=> addScene mainScene true

mainScene :: SceneConfig {}
mainScene =
  defaultSceneConfig { create = create }

create scene _state = void do
    rect <- Graphics.rectangle {x: 100.0, y: 100.0} {width: 100.0, height: 100.0}
