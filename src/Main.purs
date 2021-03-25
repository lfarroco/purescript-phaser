module Main where

import Prelude

import Effect (Effect)
import Effect.Class.Console (log)
import Graphics.Phaser (createGame)
import Graphics.Phaser.Container (addContainer, addToContainer)
import Graphics.Phaser.Events (createListener, createEmitter, destroyEmitter)
import Graphics.Phaser.Image (addImage)
import Graphics.Phaser.Loader (loadImages)
import Graphics.Phaser.Scene (PhaserScene, SceneManager, addScene, getSceneManager, removeScene)
import Phaser.Graphics.Rect (solidColorRect)

main :: Effect Unit
main = do
  game <- createGame {width: 400, height: 400}
  sceneManager <- getSceneManager game
  scene <- testScene1 sceneManager
    
  log "done!"

testScene1 :: SceneManager -> Effect PhaserScene
testScene1 sceneManager = addScene "testScene"
      { init: \scene data_ -> log "init!"
      , create: \scene data_ -> do 
          emitter <- createEmitter unit
          speak <- createListener "speak_event" (\n-> log $ "weee" <> show n) emitter
          img <- addImage "test" {x: 40.0, y: 10.0} scene 
          cont <- addContainer {x: 100.0, y: 100.0} scene
          addToContainer cont img
          rec <- solidColorRect {x: 100.0, y:100.0} {width: 200.0, height: 20.0} "0x00ff00" scene
          _ <- testScene2 sceneManager 
          speak 111
          speak 222
          speak 333
          destroyEmitter emitter
          speak 444
          log "hahah"
      , update: \scene -> pure unit
      , preload: \scene -> loadImages [{key: "test", path: "assets/test.png"}] scene
      }
      true
      sceneManager
      {}

testScene2 :: SceneManager -> Effect PhaserScene
testScene2 sceneManager = addScene "testScene2"
      { init: \_ _ -> log "2init!"
      , create: \scene _ -> do
          _ <- addImage "test" {x: 40.0, y: 110.0} scene 
          _ <- addImage "test" {x: 50.0, y: 120.0} scene 
          _ <- addImage "test" {x: 60.0, y: 130.0} scene 
          removeScene  sceneManager "testScene"
          log "done creating"
      , update: \_ -> pure unit
      , preload: \scene -> loadImages [{key: "test", path: "assets/test.png"}] scene
      }
      true
      sceneManager
      {}
