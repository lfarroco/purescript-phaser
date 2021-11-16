module Main where

import Prelude
import Effect (Effect)
import Graphics.Phaser as Phaser
import Graphics.Phaser.ForeignTypes (PhaserImage, PhaserScene)
import Graphics.Phaser.GameObject (OnClickCallback, onClick, setAngle, setDisplaySize, setPosition)
import Graphics.Phaser.Image as Image
import Graphics.Phaser.Loader (loadImages)
import Graphics.Phaser.Scene (launchByKey)
import Graphics.Phaser.SceneManager (Start(..), addScene)
import Graphics.Phaser.Text as Text

main :: Effect Unit
main = do
  game <- Phaser.create { width: 400.0, height: 400.0 }
  _mScene <- addScene "main" mainScene Start game
  _sScene <- addScene "snd" secondScene NoStart game -- autostart is false by default
  pure unit

mainScene ::
  { create :: PhaserScene -> Effect Unit
  , preload :: PhaserScene -> Effect Unit
  }
mainScene =
  { create:
      \scene -> do
        _ <- Text.create "Click the logo to create a new scene" scene
        startButton scene
  , preload:
      \scene ->
        loadImages [ { key: "logo", path: logoPath } ] scene
  }
  where
  startButton :: PhaserScene -> Effect Unit
  startButton scene =
    void do
      image <-
        Image.create "logo" scene
          >>= setPosition { x: 100.0, y: 100.0 }
          >>= setDisplaySize { width: 50.0, height: 50.0 }
      -- Register callback on the image game object
      onClick callback image
    where
    callback :: OnClickCallback PhaserImage
    callback _vec1 _vec2 _event _image =
      void do
        -- Don't do anything with the image, just launch a new scene.
        launchByKey "snd" {} scene

logoPath :: String
logoPath = "https://upload.wikimedia.org/wikipedia/commons/6/64/PureScript_Logo.png"

secondScene ::
  { create :: PhaserScene -> Effect Unit
  , preload :: PhaserScene -> Effect Unit
  }
secondScene =
  { create:
      \scene -> void do createLogo scene
  , preload:
      \scene ->
        loadImages [ { key: "logo", path: logoPath } ] scene
  }
  where
  createLogo :: PhaserScene -> Effect PhaserImage
  createLogo =
    Image.create "logo"
      >=> setPosition { x: 200.0, y: 200.0 }
      >=> setAngle 30.0
      >=> setDisplaySize { width: 50.0, height: 50.0 }
