module Main where

import Prelude
import Effect (Effect)
import Graphics.Phaser as Phaser
import Graphics.Phaser.GameObject (OnClickCallback, onClick, setAngle, setDisplaySize)
import Graphics.Phaser.Image as Image
import Graphics.Phaser.Text as Text
import Graphics.Phaser.Loader (loadImages)
import Graphics.Phaser.Scene (SceneConfig, defaultSceneConfig)
import Graphics.Phaser.Scene as Scene
import Graphics.Phaser.ForeignTypes (PhaserImage, PhaserScene)

main :: Effect Unit
main =
  void do
    Phaser.create
      >>= Phaser.setGameDimensions { width: 400.0, height: 400.0 }
      >>= Phaser.addScene mainScene true
      >>= Phaser.addScene secondScene false

mainScene :: SceneConfig {}
mainScene =
  defaultSceneConfig
    { key = "main"
    , create =
      \scene _state -> do
        _ <- Text.create textConfig scene
        startButton scene
    , preload =
      \scene ->
        loadImages [ { key: "logo", path: logoPath } ] scene
    }
  where
  textConfig :: Text.TextConfig
  textConfig =
    { pos: { x: 20.0, y: 20.0 }
    , text: "Click the logo to create a new scene"
    , config: { color: "#fff", fontSize: 14, fontFamily: "sans-serif" }
    }

  startButton :: PhaserScene -> Effect Unit
  startButton scene =
    void do
      image <-
        Image.create "logo" { x: 100.0, y: 100.0 } scene
          >>= setDisplaySize { width: 50.0, height: 50.0 }
      -- Register callback on the image game object
      onClick callback image
    where
    callback :: OnClickCallback PhaserImage
    callback _vec1 _vec2 _event _image =
      void do
        -- Don't do anything with the image, just launch a new scene.
        Scene.launchByKey "snd" {} scene

logoPath :: String
logoPath = "https://upload.wikimedia.org/wikipedia/commons/6/64/PureScript_Logo.png"

secondScene :: SceneConfig {}
secondScene =
  defaultSceneConfig
    { key = "snd"
    , create =
      \scene _ -> void do createLogo scene
    , preload =
      \scene ->
        loadImages [ { key: "logo", path: logoPath } ] scene
    }
  where
  createLogo :: PhaserScene -> Effect PhaserImage
  createLogo =
    Image.create "logo" { x: 200.0, y: 200.0 }
      >=> setAngle 30.0
      >=> setDisplaySize { width: 50.0, height: 50.0 }
