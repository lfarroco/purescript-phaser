module Main where

import Prelude
import Effect (Effect)
import Graphics.Phaser as Phaser
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserScene)
import Graphics.Phaser.GameConfig (height, scene, title, width)
import Graphics.Phaser.Scene as Scene
import Graphics.Phaser.Text as Text

main :: Effect PhaserGame
main = do
  main' <- mainScene
  let
    -- | This is how you can pass optional parameters when creating a new
    -- | game instance
    config =
      (title "My example game")
        <> (width 500.0)
        <> (height 200.0)
        <> (scene [ main' ])
  Phaser.createWithConfig config

mainScene :: Effect PhaserScene
mainScene =
  Scene.newScene "main"
    >>= Scene.create
        ( \scene -> do
            void $ Text.create "The game was created with a custom display size" scene
            pure scene
        )
