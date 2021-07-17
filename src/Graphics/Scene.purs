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

type SceneConfig a =
  { key :: String
  , create :: PhaserScene -> a -> Effect Unit
  , init :: PhaserScene -> a -> Effect Unit
  , update :: PhaserScene -> Effect Unit
  , preload :: PhaserScene -> Effect Unit
  , state :: a
  }

-- | A scene where create, init, update and preload are noops.
-- | The string argument must be a unique key.
defaultSceneConfig :: String -> SceneConfig {}
defaultSceneConfig key =
  { key
  , create: \_scene _state -> pure unit
  , init: \_scene _state -> pure unit
  , update: \_scene -> pure unit
  , preload: \_scene -> pure unit
  , state: {}
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

foreign import addSceneImpl :: forall a. String -> SceneConfig a -> SceneManager -> Effect PhaserRegistry

-- TODO: add this in typeclass accepting scene and game
foreign import getRegistryImpl :: forall a. a -> Effect PhaserRegistry

foreign import getRegistryDataImpl :: forall a. Fn2 PhaserRegistry String (Effect a)

getRegistryData :: forall a. PhaserRegistry -> String -> Effect a
getRegistryData = runFn2 getRegistryDataImpl

foreign import setRegistryDataImpl :: forall a. Fn3 PhaserRegistry String a (Effect a)

setRegistryData :: forall st. PhaserRegistry -> String -> st -> Effect st
setRegistryData = runFn3 setRegistryDataImpl

-- | Local data storage
foreign import getDataImpl :: forall a. Fn2 String PhaserScene (Effect a)
foreign import setDataImpl :: forall a. Fn3 String a PhaserScene (Effect Unit)

getData :: forall a. String -> PhaserScene -> Effect a
getData key scene = runFn2 getDataImpl key scene

setData :: forall a. String -> a -> PhaserScene -> Effect Unit
setData key data_ scene = runFn3 setDataImpl key data_ scene

foreign import getByKeyImpl :: Fn2 SceneManager String (Effect PhaserScene)

foreign import remove :: PhaserScene -> (Effect Unit)

foreign import launchImpl :: forall model. Fn2 PhaserScene model (Effect Unit)

foreign import startImpl :: forall model. Fn2 model PhaserScene (Effect Unit)

foreign import restartImpl :: forall model. Fn2 PhaserScene model (Effect Unit)

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
foreign import setEventImpl :: String -> (Unit -> Effect Unit) -> PhaserScene -> Effect Unit

foreign import setTimedEvent :: String -> (Time -> Delta -> Effect Unit) -> PhaserScene -> Effect Unit

foreign import setGameObjectEvent :: String -> (PhaserGameObject -> PhaserScene -> Effect Unit) -> Effect Unit

getByKey :: SceneManager -> String -> Effect PhaserScene
getByKey manager key = runFn2 getByKeyImpl manager key

-- | Starts the given scene in parallel with the current one
launch :: forall a. PhaserScene -> a -> Effect Unit
launch scene a = runFn2 launchImpl scene a

launchByKey :: forall a. String -> a -> PhaserScene -> Effect Unit
launchByKey = runFn3 launchByKeyImpl

startByKey :: forall a. String -> a -> PhaserScene -> Effect Unit
startByKey = runFn3 startByKeyImpl

removeByKey :: String -> PhaserScene -> Effect Unit
removeByKey = runFn2 removeByKeyImpl

foreign import launchByKeyImpl :: forall a. Fn3 String a PhaserScene (Effect Unit)

foreign import startByKeyImpl :: forall a. Fn3 String a PhaserScene (Effect Unit)

foreign import removeByKeyImpl :: Fn2 String PhaserScene (Effect Unit)

foreign import getPluginInstanceImpl :: forall a. Fn2 PhaserScene String (Effect a)

getPluginInstance :: forall a. PhaserScene -> String -> Effect a
getPluginInstance = runFn2 getPluginInstanceImpl 

start :: forall a. a -> PhaserScene -> Effect Unit
start = runFn2 startImpl

restart :: forall a. PhaserScene -> a -> Effect Unit
restart scene a = runFn2 restartImpl scene a

setEvent :: SceneEvent -> PhaserScene -> Effect Unit
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
  ShutDown fn ->  setEventImpl "shutdown" fn
  Destroy fn -> setEventImpl "destroy" fn 
  Resize fn -> setEventImpl "resize" fn 
  Boot fn -> setEventImpl "boot" fn 
  -- AddedToScene fn -> setGameObjectEvent "addedtoscene" fn 
  -- RemovedFromScene fn -> setGameObjectEvent "removedfromscene" fn 

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
  -- | AddedToScene (PhaserGameObject -> PhaserScene -> Effect Unit)
  -- | RemovedFromScene (PhaserGameObject -> PhaserScene -> Effect Unit)
