module Main where

import Prelude
import Effect (Effect)
import Graphics.Phaser as Phaser
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserScene, PhaserGraphic)
import Graphics.Phaser.Graphics as Graphics
import Graphics.Phaser.Scene (SceneConfig, defaultSceneConfig)

-- Adapted from https://phaser.io/examples/v3/view/game-objects/graphics/primitives/rectangle-filled
main :: Effect PhaserGame
main =
  Phaser.create
    >>= Phaser.setGameDimensions { width: 800.0, height: 600.0 }
    >>= Phaser.addScene mainScene true

drawGreenRect :: PhaserGraphic -> Effect PhaserGraphic
drawGreenRect =
  Graphics.fillStyle "0x00ff00" 1.0
    >=> Graphics.fillRect { x: 100.0, y: 100.0 } { width: 256.0, height: 256.0 }

drawRedRect :: PhaserGraphic -> Effect PhaserGraphic
drawRedRect =
  Graphics.fillStyle "0xff0000" 0.5
    >=> Graphics.fillRect { x: 250.0, y: 200.0 } { width: 400.0, height: 256.0 }

create :: PhaserScene -> Effect Unit
create scene =
  void
    $ Graphics.create scene
    >>= drawGreenRect
    >>= drawRedRect

mainScene :: SceneConfig
mainScene =
  defaultSceneConfig
    { create = create
    }
