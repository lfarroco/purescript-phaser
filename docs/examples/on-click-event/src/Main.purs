module Main where

import Prelude
import Effect (Effect)
import Graphics.Phaser (addScene)
import Graphics.Phaser as Phaser
import Graphics.Phaser.ForeignTypes (PhaserImage, PhaserScene)
import Graphics.Phaser.GameObject (OnClickCallback, onClick, setDisplaySize)
import Graphics.Phaser.Image as Image
import Graphics.Phaser.Loader (loadImages)
import Graphics.Phaser.Scene (SceneConfig, defaultSceneConfig)
import Graphics.Phaser.Text as Text

main :: Effect Unit
main =
  void do
    Phaser.create
      >>= Phaser.setGameDimensions { width: 300.0, height: 300.0 }
      >>= addScene mainScene true

mainScene :: SceneConfig {}
mainScene =
  defaultSceneConfig
    { key = "main"
    , create =
      \scene _state ->
        void do
          _ <- Text.create textConfig scene
          startButton scene
    , preload = loadImages [ { key: "logo", path: logoPath } ]
    }
  where
  textConfig :: Text.TextConfig
  textConfig =
    { pos: { x: 20.0, y: 20.0 }
    , text: "Click the logo to trigger an event"
    , config: { color: "#fff", fontSize: 14, fontFamily: "sans-serif" }
    }

  startButton :: PhaserScene -> Effect PhaserScene
  startButton scene = do
    image <-
      Image.create "logo" { x: 100.0, y: 100.0 } scene
        >>= setDisplaySize { width: 50.0, height: 50.0 }
    -- Register callback on the image game object
    _ <- onClick callback image
    pure scene
    where
    callback :: OnClickCallback PhaserImage
    callback _vec1 _vec2 _event _image = do
      _ <-
        Image.create "logo" { x: 200.0, y: 200.0 } scene
          >>= setDisplaySize { width: 150.0, height: 150.0 }
      pure unit

  logoPath :: String
  logoPath = "https://upload.wikimedia.org/wikipedia/commons/6/64/PureScript_Logo.png"
