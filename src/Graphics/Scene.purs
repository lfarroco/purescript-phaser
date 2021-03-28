module Graphics.Phaser.Scene
  ( addScene
  , getSceneManager
  , SceneManager
  , PhaserScene
  , Time
  , Delta
  , SceneEvent(..)
  , getByKey
  , remove
  , start
  , run
  , stop
  ) where


-- TODO: add scene.data, and support for scene.data events

-- Use this as example to refactor to Fn2, Fn3 
-- https://github.com/purescript-web/purescript-canvas/blob/master/src/Graphics/Canvas.purs#L167
import Prelude
import Data.Function.Uncurried (Fn2, runFn2)
import Effect (Effect)
import Graphics.Phaser (PhaserGame)
import Graphics.Phaser.GameObject (PhaserGameObject)

foreign import data PhaserScene :: Type

foreign import data SceneManager :: Type

-- Current time in milliseconds
type Time
  = Number

-- Milliseconds since the last frame
type Delta
  = Number

foreign import addScene ::
  forall a.
  String ->
  { create :: PhaserScene -> a -> Effect Unit
  , init :: PhaserScene -> a -> Effect Unit
  , update :: PhaserScene -> Effect Unit
  , preload :: PhaserScene -> Effect Unit
  } ->
  Boolean ->
  SceneManager ->
  a ->
  Effect Unit

foreign import getByKeyImpl :: Fn2 SceneManager String (Effect PhaserScene)

foreign import remove :: PhaserScene -> (Effect Unit)

foreign import launchImpl :: forall a. Fn2 PhaserScene a (Effect Unit)

foreign import startImpl :: forall a. Fn2 PhaserScene a (Effect Unit)

foreign import restartImpl :: forall a. Fn2 PhaserScene a (Effect Unit)

foreign import pause :: PhaserScene -> (Effect Unit)

foreign import resume :: PhaserScene -> (Effect Unit)

foreign import sleep :: PhaserScene -> (Effect Unit)

foreign import wake :: PhaserScene -> (Effect Unit)

foreign import switch :: PhaserScene -> (Effect Unit)

foreign import run :: PhaserScene -> (Effect Unit)

foreign import stop :: PhaserScene -> (Effect Unit)

foreign import setVisible :: PhaserScene -> (Effect Unit)

foreign import sendToBack :: PhaserScene -> (Effect Unit)

foreign import bringToTop :: PhaserScene -> (Effect Unit)

foreign import getSceneManager :: PhaserGame -> Effect SceneManager

-- Comprehensive event list
-- https://rexrainbow.github.io/phaser3-rex-notes/docs/site/scene/
foreign import setEvent_ :: String -> (Unit -> Effect Unit) -> Effect Unit

foreign import setTimedEvent :: String -> (Time -> Delta -> Effect Unit) -> Effect Unit

foreign import setGameObjectEvent :: String -> (PhaserGameObject -> PhaserScene -> Effect Unit) -> Effect Unit

getByKey :: SceneManager -> String -> Effect PhaserScene
getByKey manager key = runFn2 getByKeyImpl manager key

launch :: forall a. PhaserScene -> a -> Effect Unit
launch scene a = runFn2 launchImpl scene a

start :: forall a. PhaserScene -> a -> Effect Unit
start scene a = runFn2 startImpl scene a

restart :: forall a. PhaserScene -> a -> Effect Unit
restart scene a = runFn2 restartImpl scene a

-- TODO: return an EventEmitter
setEvent :: Partial => SceneEvent -> Effect Unit
setEvent event = case event of
  Start fn -> setEvent_ "start" fn
  PreUpdate fn -> setTimedEvent "preupdate" fn
  Update fn -> setTimedEvent "update" fn
  PostUpdate fn -> setTimedEvent "postupdate" fn
  Render fn -> setEvent_ "render" fn
  Pause fn -> setEvent_ "pause" fn
  Resume fn -> setEvent_ "resume" fn
  Sleep fn -> setEvent_ "sleep" fn
  Wake fn -> setEvent_ "wake" fn
  Destroy fn -> setEvent_ "destroy" fn
  Resize fn -> setEvent_ "resize" fn
  Boot fn -> setEvent_ "boot" fn
  AddedToScene fn -> setGameObjectEvent "addedtoscene" fn
  RemovedFromScene fn -> setGameObjectEvent "removedfromscene" fn

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
  | AddedToScene (PhaserGameObject -> PhaserScene -> Effect Unit)
  | RemovedFromScene (PhaserGameObject -> PhaserScene -> Effect Unit)
