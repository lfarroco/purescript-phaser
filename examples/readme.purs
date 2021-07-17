module Main where

import Prelude

import Effect (Effect)
import Graphics.Phaser (addScene)
import Graphics.Phaser as Phaser
import Graphics.Phaser.GameObject
  ( OnClickCallback
  , Vector
  , Dimensions
  , onClick
  , setAngle
  , setDisplaySize
  )
import Graphics.Phaser.Image as Image
import Graphics.Phaser.Loader (loadImages)
import Graphics.Phaser.Scene (SceneConfig)
import Graphics.Phaser.Scene as Scene
import Phaser.Graphics.ForeignTypes (Event, PhaserGame, PhaserImage, PhaserScene)

runGame :: Dimensions -> Effect PhaserGame
runGame =
  Phaser.create
    >=> addScene mainScene true
    >=> addScene secondScene false

main :: Effect Unit
main = do
  _ <- runGame { width: 800, height: 600 }
  pure unit

startButton :: PhaserScene -> Effect PhaserScene
startButton scene = do
  _ <- Image.create "logo" { x: 100.0, y: 100.0 } scene
    >>= setDisplaySize { width: 50, height: 50 }
  onClick scene
  pure scene
  where
  onClick :: PhaserScene -> Effect Unit
  onClick = Scene.launchByKey "snd" "zxcb"

mainScene :: SceneConfig {}
mainScene =
  { key: "main"
  , create:
      \scene _ -> do
        _ <- startButton scene
        pure unit
  , init: \_scene _ -> pure unit
  , update: \_scene -> pure unit
  , preload: \scene ->
        loadImages [ { key: "logo", path: logoPath } ] scene
  , state: {}
  }

logoPath :: String
logoPath = "https://upload.wikimedia.org/wikipedia/commons/6/64/PureScript_Logo.png"

secondScene :: SceneConfig {}
secondScene =
  { key: "snd"
  , create:
      \scene _ -> do
        _ <- createLogo scene
        pure unit
  , init: \_scene _ -> pure unit
  , update: \_scene -> pure unit
  , preload: \scene ->
        loadImages [ { key: "logo", path: logoPath } ] scene
  , state: {}
  }

createLogo :: PhaserScene -> Effect PhaserImage
createLogo =
  Image.create "logo" { x: 200.0, y: 200.0 }
    >=> setAngle 30.0
    >=> setDisplaySize { width: 50, height: 50 }