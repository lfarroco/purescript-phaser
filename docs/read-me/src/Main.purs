module Main where

import Prelude
import Effect (Effect)
import Graphics.Phaser (addScene)
import Graphics.Phaser as Phaser
import Graphics.Phaser.GameObject (Dimensions, OnClickCallback, onClick, setDisplaySize)
import Graphics.Phaser.Image as Image
import Graphics.Phaser.Text as Text
import Graphics.Phaser.Loader (loadImages)
import Graphics.Phaser.Scene (SceneConfig, defaultSceneConfig)
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserImage, PhaserScene)

main :: Effect Unit
main = do
  _ <- runGame { width: 300, height: 300 }
  pure unit

runGame :: Dimensions -> Effect PhaserGame
runGame =
  Phaser.create
    >=> addScene mainScene true

mainScene :: SceneConfig {}
mainScene =
  defaultSceneConfig
    { key = "main"
    , create = 
      \scene _state -> do
        _ <-  Text.create textConfig scene 
        _ <- startButton scene
        pure unit
    , preload = loadImages [ { key: "logo", path: logoPath } ]
    }
  where
  textConfig :: Text.TextConfig
  textConfig = { pos : { x : 20.0, y : 20.0 }
             , text : "Click the logo to trigger an event"
             , config : { color : "#fff", fontSize : 14, fontFamily : "sans-serif" }
             }
  startButton :: PhaserScene -> Effect PhaserScene
  startButton scene = do
    image <- Image.create "logo" { x: 100.0, y: 100.0 } scene
             >>= setDisplaySize { width: 50, height: 50 }
    -- Register callback on the image game object
    _ <- onClick callback image
    pure scene
    where
    callback :: OnClickCallback PhaserImage
    callback _vec1 _vec2 _event _image = do
      _ <- Image.create "logo" { x: 200.0, y: 200.0 } scene
           >>= setDisplaySize { width: 150, height: 150 }
      pure unit

  logoPath :: String
  logoPath = "https://upload.wikimedia.org/wikipedia/commons/6/64/PureScript_Logo.png"
