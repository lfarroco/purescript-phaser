# purescript-phaser

Bindings for common Phaser 3 operations. As Phaser has a large API, not everything is implemented.
Feel free to open a PR or ask for a new binding!

Some bindings allow a more FP-friendly way of handling operations,
like passing a `Scene` as an argument for the `create` function, as we
are not accessing use `this`.

Here's a simple example:

```
module Main where

import Prelude

import Effect (Effect)
import Graphics.Phaser (addScene)
import Graphics.Phaser as Phaser
import Graphics.Phaser.GameObject (Dimensions, setDisplaySize)
import Graphics.Phaser.Image as Image
import Graphics.Phaser.Loader (loadImages)
import Graphics.Phaser.Scene (SceneConfig, defaultSceneConfig)
import Phaser.Graphics.ForeignTypes (PhaserGame, PhaserScene)

runGame :: Dimensions -> Effect PhaserGame
runGame = Phaser.create
  >=> addScene mainScene true

main :: Effect Unit
main = do
  _ <- runGame { width: 800, height: 600 }
  pure unit

startButton :: PhaserScene -> Effect PhaserScene
startButton scene = do
  _ <- Image.create "logo" { x: 100.0, y: 100.0 } scene
    >>= setDisplaySize { width: 50, height: 50 }
  pure scene

mainScene :: SceneConfig {}
mainScene = defaultSceneConfig
  { key = "main"
  , create = \scene _state -> do
      _ <- startButton scene
      pure unit
  , preload = \scene ->
      loadImages [ { key: "logo", path: logoPath } ] scene
  }

logoPath :: String
logoPath = "https://upload.wikimedia.org/wikipedia/commons/6/64/PureScript_Logo.png"

```
