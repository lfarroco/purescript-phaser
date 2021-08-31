module Main where

import Prelude
import Effect (Effect)
import Graphics.Phaser (addScene)
import Graphics.Phaser as Phaser
import Graphics.Phaser.GameObject (Dimensions, OnClickCallback, getScene, onClick, setDisplaySize)
import Graphics.Phaser.Image as Image
import Graphics.Phaser.Loader (loadImages)
import Graphics.Phaser.Scene (SceneConfig, defaultSceneConfig)
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserImage, PhaserScene)

main :: Effect Unit
main = do
  _ <- runGame { width: 800, height: 600 }
  pure unit

runGame :: Dimensions -> Effect PhaserGame
runGame =
  Phaser.create
    >=> addScene mainScene true

mainScene :: SceneConfig {}
mainScene =
  defaultSceneConfig
    -- Use record update syntax to change relevant defaults
    { key = "main"
    , create =
      \scene _state -> do
        _ <- startButton scene
        pure unit
    , preload =
      \scene ->
        loadImages [ { key: "logo", path: logoPath } ] scene
    }
  where
  startButton :: PhaserScene -> Effect PhaserScene
  startButton scene = do
    image <-
      Image.create "logo" { x: 100.0, y: 100.0 } scene
        >>= setDisplaySize { width: 50, height: 50 }
    -- Register callback on the image game object
    _ <- onClick callback image
    pure scene
    where
    callback :: OnClickCallback PhaserImage
    callback _vec1 _vec2 _event image = do
      -- Example of how to get a game object's scene
      imageScene <- getScene image
      pure unit

  logoPath :: String
  logoPath = "https://upload.wikimedia.org/wikipedia/commons/6/64/PureScript_Logo.png"
