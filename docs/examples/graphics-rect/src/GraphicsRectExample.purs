module Main where

import Prelude
import Effect (Effect)
import Graphics.Phaser as Phaser
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserGraphic, PhaserScene)
import Graphics.Phaser.Graphics as Graphics
import Graphics.Phaser.Scene as Scene

-- Adapted from https://phaser.io/examples/v3/view/game-objects/graphics/primitives/rectangle-filled
main :: Effect PhaserGame
main = do
  scene <- mainScene
  -- | This is how you can pass optional parameters when creating a new
  -- | game instance
  let
    config =
      (Phaser.config.width 800.0)
        <> (Phaser.config.height 600.0)
        <> (Phaser.config.scene [ scene ])
  Phaser.createWithConfig config

mainScene :: Effect PhaserScene
mainScene = do
  Scene.newScene "main"
    >>= Scene.create
        ( \scene -> do
            void $ Graphics.create scene >>= drawGreenRect >>= drawRedRect
            pure scene
        )
  where
  drawGreenRect :: PhaserGraphic -> Effect PhaserGraphic
  drawGreenRect =
    Graphics.fillStyle "0x00ff00" 1.0
      >=> Graphics.fillRect { x: 100.0, y: 100.0 } { width: 256.0, height: 256.0 }

  drawRedRect :: PhaserGraphic -> Effect PhaserGraphic
  drawRedRect =
    Graphics.fillStyle "0xff0000" 0.5
      >=> Graphics.fillRect { x: 250.0, y: 200.0 } { width: 400.0, height: 256.0 }
