# purescript-phaser

Bindings for common Phaser 3 operations. As Phaser has a large API, not everything is implemented.
Feel free to open a PR or ask for a new binding!

Some bindings allow a more FP-friendly way of handling operations,
like passing a `Scene` as an argument for the `create` function, as we
are not accessing using `this`.

<br>

## Examples

Here's a simple example:

```purescript
module Main where

import Prelude

import Effect (Effect)
import Graphics.Phaser (addScene)
import Graphics.Phaser as Phaser
import Graphics.Phaser.GameObject (Dimensions, setDisplaySize)
import Graphics.Phaser.Image as Image
import Graphics.Phaser.Loader (loadImages)
import Graphics.Phaser.Scene (SceneConfig, defaultSceneConfig)
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserScene)

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

Build it with:

```bash
cd examples/read-me/
spago build
```

---

### Installing
This library should be available on pursuit shortly, in the meantime you can clone the repo
and add:
```dhall
in  upstream
  with phaser =
      /some/path/to/purescript-phaser/spago.dhall as Location
```
to your packages.dhall. Add 'phaser' to the dependencies in `spago.dhall` and run
```bash
spago build
```
<br>

### Building the examples' JS

For each directory on `./examples`, run:

```bash
<<<<<<< HEAD
spago bundle-app
=======
spago bundle-app --to ../dist/index.js --watch
>>>>>>> 9540186 (refactor using EffectFn and runEffectFn)
```

After that creating an `.html` file in the directory with this content
in its `<head>` tag:

```html
<script src="https://cdn.jsdelivr.net/npm/phaser@3.53.1/dist/phaser.js"></script>
<script src="index.js"></script>
```

After that, opening the `.html` file should display the expected results.
