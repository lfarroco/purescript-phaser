module Main where

import Prelude
import Data.Maybe (Maybe(..))
import Data.Options ((:=))
import Effect (Effect)
import Graphics.Phaser as Phaser
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserScene)
import Graphics.Phaser.GameConfig (width, height, title)
import Graphics.Phaser.Scene as Scene
import Graphics.Phaser.Text as Text

main :: Effect PhaserGame
main = do
  main' <- mainScene
  let
    -- | This is how you can pass optional parameters when creating a new
    -- | game instance
    config =
      title := Just "My example game"
        <> width := Just 500.0
        <> height := Just 200.0
  Phaser.createWithConfig config
    >>= Phaser.addScene "main" main' true

mainScene :: Effect PhaserScene
mainScene =
  Scene.newScene "main"
    >>= Scene.create
        ( \scene -> do
            void $ Text.create "The game was created with a custom display size" scene
            pure scene
        )
