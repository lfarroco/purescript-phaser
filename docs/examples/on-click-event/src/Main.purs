module Main where

import Prelude
import Effect (Effect)
import Graphics.Phaser as Phaser
import Graphics.Phaser.ForeignTypes (PhaserScene)
import Graphics.Phaser.Loader (loadImages)
import Graphics.Phaser.SceneManager (Start(..), addScene)
import Graphics.Phaser.Text as Text

main :: Effect Unit
main =
  void do
    game <- Phaser.create { width: 400.0, height: 300.0 }
    addScene "main" mainScene Start game

mainScene ::
  { create :: PhaserScene -> Effect Unit
  , preload :: PhaserScene -> Effect Unit
  }
mainScene =
  { create:
      \scene ->
        void do
          _ <- Text.create "Click the logo to trigger an event" scene
          startButton scene
  , preload:
      loadImages [ { key: "logo", path: logoPath } ]
  }
  where
  startButton :: PhaserScene -> Effect PhaserScene
  startButton scene = do
    -- image <-
    --   Image.create "logo" scene
    --     >>= setPosition { x: 100.0, y: 100.0 }
    --     >>= setDisplaySize { width: 50.0, height: 50.0 }
    -- Register callback on the image game object
    -- _ <- onClick callback image
    pure scene
    -- where
    -- callback :: OnClickCallback PhaserImage
    -- callback _vec1 _vec2 _event _image = do
    --   log "Clicked!"
    --   _ <-
    --     Image.create "logo" scene
    --       >>= setPosition { x: 200.0, y: 200.0 }
    --       >>= setDisplaySize { width: 150.0, height: 150.0 }
    --   pure unit

  logoPath :: String
  logoPath = "https://upload.wikimedia.org/wikipedia/commons/6/64/PureScript_Logo.png"
