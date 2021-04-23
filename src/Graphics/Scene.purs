module Graphics.Phaser.Scene where

-- TODO: add scene.data, and support for scene.data events
-- Use this as example to refactor to Fn2, Fn3 
-- https://github.com/purescript-web/purescript-canvas/blob/master/src/Graphics/Canvas.purs#L167

import Prelude

import Data.Function.Uncurried (Fn2, Fn3, runFn2, runFn3)
import Effect (Effect)
import Phaser.Graphics.ForeignTypes (PhaserGame, PhaserGameObject, PhaserRegistry, PhaserScene, SceneManager)

-- Current time in milliseconds
type Time
  = Number

-- Milliseconds since the last frame
type Delta
  = Number

type SceneConfig a
  = { key :: String
    , create :: PhaserScene -> a -> Effect Unit
    , init :: PhaserScene -> a -> Effect Unit
    , update :: PhaserScene -> Effect Unit
    , preload :: PhaserScene -> Effect Unit
    , state :: a
    }

class SceneManagerConnected a where
  getSceneManager :: a -> Effect SceneManager

foreign import getSceneManagerImpl :: forall a. a -> Effect SceneManager

instance sceneSceneManagerConnection :: SceneManagerConnected PhaserScene where
  getSceneManager = getSceneManagerImpl

instance gameSceneManagerConnection :: SceneManagerConnected PhaserGame where
  getSceneManager = getSceneManagerImpl

class RegistryConnected a where
  getRegistry :: a -> Effect PhaserRegistry

instance sceneRegistryConnection :: RegistryConnected PhaserScene where
  getRegistry = getRegistryImpl

instance gameRegistryConnection :: RegistryConnected PhaserGame where
  getRegistry = getRegistryImpl

-- TODO: add this in typeclass accepting scene and game
foreign import getRegistryImpl :: forall a. a-> Effect PhaserRegistry

foreign import getStateImpl :: forall a. Fn2 PhaserRegistry String (Effect a)

getState :: forall a. SceneConfig a -> PhaserRegistry -> String -> Effect a
getState config registry key = runFn2 getStateImpl registry key

-- | Same as getState, but not bound to a specific scene config
unsafeGetState :: forall a. PhaserRegistry -> String -> Effect a
unsafeGetState = runFn2 getStateImpl

foreign import setStateImpl :: forall a. Fn3 PhaserRegistry String a (Effect a)

setState :: forall st. SceneConfig st -> PhaserRegistry -> String -> st -> Effect st
setState config registry key state = runFn3 setStateImpl registry key state

-- | Same as setState, but not bound to a specific scene config
unsafeSetState :: forall st. PhaserRegistry -> String -> st -> Effect st
unsafeSetState = runFn3 setStateImpl


-- | Local data storage
foreign import getDataImpl :: forall a. Fn2 String PhaserScene (Effect a)
foreign import setDataImpl :: forall a. Fn3 String a PhaserScene (Effect a)

getData :: forall st. SceneConfig st -> String -> PhaserScene -> Effect st
getData conf key scene = runFn2 getDataImpl key scene

setData :: forall st. SceneConfig st -> String -> st -> PhaserScene -> Effect st
setData conf key data_ scene = runFn3 setDataImpl key data_ scene

foreign import getByKeyImpl :: Fn2 SceneManager String (Effect PhaserScene)

foreign import remove :: PhaserScene -> (Effect Unit)

foreign import launchImpl :: forall a. Fn2 PhaserScene a (Effect Unit)

foreign import startImpl :: forall a. Fn2 a PhaserScene (Effect Unit)

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

-- Comprehensive event list
-- https://rexrainbow.github.io/phaser3-rex-notes/docs/site/scene/
foreign import setEventImpl :: String -> (Unit -> Effect Unit) -> Effect Unit

foreign import setTimedEvent :: String -> (Time -> Delta -> Effect Unit) -> Effect Unit

foreign import setGameObjectEvent :: String -> (PhaserGameObject -> PhaserScene -> Effect Unit) -> Effect Unit

getByKey :: SceneManager -> String -> Effect PhaserScene
getByKey manager key = runFn2 getByKeyImpl manager key

-- | Starts the given scene in parallel with the current one
launch :: forall a. PhaserScene -> a -> Effect Unit
launch scene a = runFn2 launchImpl scene a

launchByKey :: forall a. String -> a -> PhaserScene -> Effect Unit
launchByKey = runFn3 launchByKeyImpl

foreign import launchByKeyImpl :: forall a. Fn3 String a PhaserScene (Effect Unit)

foreign import getPluginInstanceImpl :: forall a. Fn2 PhaserScene String (Effect a)

getPluginInstance :: forall a. PhaserScene -> String -> Effect a
getPluginInstance = runFn2 getPluginInstanceImpl 

start :: forall a. a -> PhaserScene -> Effect Unit
start = runFn2 startImpl

restart :: forall a. PhaserScene -> a -> Effect Unit
restart scene a = runFn2 restartImpl scene a

setEvent :: Partial => SceneEvent -> Effect Unit
setEvent event = case event of
  Start fn -> setEventImpl "start" fn
  PreUpdate fn -> setTimedEvent "preupdate" fn
  Update fn -> setTimedEvent "update" fn
  PostUpdate fn -> setTimedEvent "postupdate" fn
  Render fn -> setEventImpl "render" fn
  Pause fn -> setEventImpl "pause" fn
  Resume fn -> setEventImpl "resume" fn
  Sleep fn -> setEventImpl "sleep" fn
  Wake fn -> setEventImpl "wake" fn
  Destroy fn -> setEventImpl "destroy" fn
  Resize fn -> setEventImpl "resize" fn
  Boot fn -> setEventImpl "boot" fn
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
