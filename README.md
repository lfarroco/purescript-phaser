# purescript-phaser

Bindingins for common PhaserJs 3 operations. As Phaser has a
very large API, not everything is implemented.
Feel free to open an PR or ask for a new binding!

Some bindings allow a more FP-friendly way of handling operations,
like passing a `Scene` as a argument for the `create` function, as we
are not accesing use `this`.

```
main :: Effect Unit
main = do
  game <- createGame {width: 400, height: 400}
  sceneManager <- getSceneManager game
  scene <-
    addScene "testScene"
      { init: \_ _ -> log "init!"
      , create: \scene _ -> do
          img <- addImage "test" {x: 40.0, y: 10.0} scene
          cont <- addContainer {x: 100.0, y: 100.0} scene
          addToContainer cont img
          rec <- solidColorRect {x: 100.0, y:100.0} {width: 200.0, height: 20.0} "0x00ff00" scene
          log "done creating"
      , update: \_ -> pure unit
      , preload: \scene -> loadImages [{key: "test", path: "assets/test.png"}] scene
      }
      true
      sceneManager
      {}
```
