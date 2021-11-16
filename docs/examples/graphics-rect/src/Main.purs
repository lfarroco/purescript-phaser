module Main where

import Prelude
import Effect (Effect)
import Graphics.Phaser as Phaser
import Graphics.Phaser.ForeignTypes (PhaserGraphic, PhaserScene)
import Graphics.Phaser.Graphics as Graphics
import Graphics.Phaser.SceneManager (Start(..), addScene)

-- Adapted from https://phaser.io/examples/v3/view/game-objects/graphics/primitives/rectangle-filled
main :: Effect Unit
main = do
  game <- Phaser.create { width: 800.0, height: 600.0 }
  _maybeScene <-
    addScene
      "scene 1"
      { create }
      Start
      game
  pure unit

create :: PhaserScene -> Effect Unit
create scene =
  void
    $ Graphics.create scene
    >>= drawGreenRect
    >>= drawRedRect

drawGreenRect :: PhaserGraphic -> Effect PhaserGraphic
drawGreenRect =
  Graphics.fillStyle "0x00ff00" 1.0
    >=> Graphics.fillRect { x: 100.0, y: 100.0 } { width: 256.0, height: 256.0 }

drawRedRect :: PhaserGraphic -> Effect PhaserGraphic
drawRedRect =
  Graphics.fillStyle "0xff0000" 0.5
    >=> Graphics.fillRect { x: 250.0, y: 200.0 } { width: 400.0, height: 256.0 }
