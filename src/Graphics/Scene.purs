module Graphics.Phaser.Scene (
  addScene,
  getSceneManager,
  removeScene,
  SceneManager,
  PhaserScene,
  Time, Delta,
  SceneEvent(..),
  GameObject
  ) where

import Prelude

import Effect (Effect)
import Graphics.Phaser (PhaserGame)

foreign import data PhaserScene :: Type

foreign import data SceneManager :: Type

-- Current time in milliseconds
type Time
  = Number

-- Milliseconds since the last frame
type Delta
  = Number

foreign import addScene :: forall a. 
  String ->
  { create :: PhaserScene -> a -> Effect Unit
  , init :: PhaserScene -> a -> Effect Unit
  , update :: PhaserScene -> Effect Unit
  , preload :: PhaserScene -> Effect Unit
  } ->
  Boolean -> SceneManager -> a -> Effect PhaserScene

foreign import getSceneManager :: PhaserGame -> Effect SceneManager

-- Destroys the scene and fires its `destroy` event
foreign import removeScene :: SceneManager -> String -> Effect Unit  

-- Comprehensive event list
-- https://rexrainbow.github.io/phaser3-rex-notes/docs/site/scene/
foreign import setEvent_ :: String -> (Unit -> Effect Unit) -> Effect Unit

foreign import setTimedEvent :: String -> (Time -> Delta-> Effect Unit) -> Effect Unit

foreign import setGameObjectEvent :: String -> (GameObject -> PhaserScene-> Effect Unit) -> Effect Unit

foreign import data GameObject :: Type

-- how to define arbitraty events...
-- https://phaser.io/examples/v3/view/events/emit-scene-event
-- make scene.events return an EventEmitter

setEvent :: Partial => SceneEvent -> Effect Unit
setEvent event = case event of
  Start fn -> setEvent_ "start" fn
  PreUpdate fn -> setTimedEvent "preupdate" fn
  Update fn -> setTimedEvent "update" fn
  PostUpdate fn -> setTimedEvent "postUpdate" fn
  Render fn -> setEvent_ "render" fn
  Pause fn -> setEvent_ "pause" fn
  Resume fn -> setEvent_ "resume" fn
  Sleep fn -> setEvent_ "sleep" fn
  Wake fn -> setEvent_ "wake" fn
  Destroy fn -> setEvent_ "destroy" fn
  Resize fn -> setEvent_ "resize" fn
  Boot fn -> setEvent_ "boot" fn
  AddedToScene fn -> setGameObjectEvent  "addedtoscene" fn
  RemovedFromScene fn -> setGameObjectEvent  "removedfromscene" fn

data SceneEvent
  = Start (Unit -> Effect Unit)
  -- Every tick
  | PreUpdate (Time -> Delta -> Effect Unit)
  | Update (Time -> Delta -> Effect Unit)
  | PostUpdate (Time -> Delta -> Effect Unit)
  | Render (Unit -> Effect Unit)
  -- State changed
  | Pause (Unit -> Effect Unit)
  | Resume (Unit -> Effect Unit)
  | Sleep (Unit -> Effect Unit)
  | Wake (Unit -> Effect Unit)
  | ShutDown (Unit -> Effect Unit)
  -- Other events
  | Destroy (Unit -> Effect Unit)
  | Resize (Unit -> Effect Unit)
  | Boot (Unit -> Effect Unit)
  -- Game Object added to scene
  | AddedToScene (GameObject -> PhaserScene -> Effect Unit)
  | RemovedFromScene (GameObject -> PhaserScene -> Effect Unit)
