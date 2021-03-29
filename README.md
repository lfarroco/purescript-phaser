# purescript-phaser

Bindingins for common PhaserJs 3 operations. As Phaser has a
very large API, not everything is implemented.
Feel free to open an PR or ask for a new binding!

Some bindings allow a more FP-friendly way of handling operations,
like passing a `Scene` as a argument for the `create` function, as we
are not accesing use `this`.

Here's an example running two scenes at once:
```
module Main where

import Prelude

import Effect (Effect)
import Graphics.Phaser (addScene)
import Graphics.Phaser as Phaser
import Graphics.Phaser.GameObject (onClick, setAngle, setDisplaySize)
import Graphics.Phaser.Image as Image
import Graphics.Phaser.Loader (loadImages)
import Graphics.Phaser.Scene (SceneConfig)
import Graphics.Phaser.Scene as Scene
import Phaser.Graphics.ForeignTypes (PhaserGame, PhaserImage, PhaserScene)

runGame :: { height :: Int , width :: Int } -> Effect PhaserGame
runGame =
  Phaser.createGame
    >=> addScene "main" mainScene true {}
    >=> addScene "snd" secondScene false {}

main :: Effect Unit
main = do
  _ <- runGame { width: 800, height: 600 }
  pure unit

startButton :: PhaserScene -> Effect PhaserImage
startButton =
  Image.create "logo" { x: 100.0, y: 100.0 }
    >=> setDisplaySize { width: 50.0, height: 50.0 }
    >=> onClick (\_ _ _ scene -> Scene.launchByKey "snd" {} scene)

mainScene :: SceneConfig {}
mainScene =
  { preload:
      \scene ->
        loadImages [ { key: "logo", path: logoPath } ] scene
  , init: \_ _ -> pure unit
  , create:
      \scene _ -> do
        _ <- startButton scene
        pure unit
  , update: \_ -> pure unit
  , data: {}
  }

logoPath :: String
logoPath = "https://upload.wikimedia.org/wikipedia/commons/6/64/PureScript_Logo.png"

secondScene :: SceneConfig {}
secondScene =
  { preload:
      \scene ->
        loadImages [ { key: "logo", path: logoPath } ] scene
  , init: \_ _ -> pure unit
  , create:
      \scene _ -> do
        logo <- createLogo scene
        pure unit
  , update: \_ -> pure unit
  , data: {}
  }

createLogo :: PhaserScene -> Effect PhaserImage
createLogo =
  Image.create "logo" { x: 200.0, y: 200.0 }
    >=> setAngle 3.0
    >=> setDisplaySize { width: 50.0, height: 50.0 }
```
