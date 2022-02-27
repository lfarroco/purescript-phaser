module Graphics.Phaser.Scene
  ( getRegistry
  , getRegistryData
  , setRegistryData
  , getData
  , setData
  , remove
  , start
  , restart
  , pause
  , resume
  , sleep
  , wake
  , switch
  , run
  , stop
  , setVisible
  , setEvent
  , setTimedEvent
  , setGameObjectEvent
  , launch
  , launchByKey
  , startByKey
  , removeByKey
  , getPluginInstance
  , SceneEvent
  , class Scene
  , Time
  , Delta
  ) where

-- TODO: add scene.data, and support for scene.data events
import Prelude
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, runEffectFn1, runEffectFn2, runEffectFn3)
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserGameObject, PhaserRegistry, PhaserScene)
import Graphics.Phaser.FFI

-- Current time in milliseconds
type Time
  = Number

-- Milliseconds since the last frame
type Delta
  = Number

class Scene a

-- class RegistryConnected a where
--   getRegistry :: a -> Effect PhaserRegistry

getRegistry =  FFI.getProperty "registry"

-- instance sceneRegistryConnection :: RegistryConnected PhaserScene where
--   getRegistry = runEffectFn1 getRegistryImpl

-- instance gameRegistryConnection :: RegistryConnected PhaserGame where
--   getRegistry = runEffectFn1 getRegistryImpl

-- TODO: add this in typeclass accepting scene and game
foreign import getRegistryImpl :: forall a. EffectFn1 a PhaserRegistry

foreign import getRegistryDataImpl :: forall a. EffectFn2 PhaserRegistry String a

getRegistryData :: forall a. PhaserRegistry -> String -> Effect a
getRegistryData = runEffectFn2 getRegistryDataImpl

foreign import setRegistryDataImpl :: forall a. EffectFn3 PhaserRegistry String a a

setRegistryData :: forall st. PhaserRegistry -> String -> st -> Effect st
setRegistryData = runEffectFn3 setRegistryDataImpl

-- | Local data storage
foreign import getDataImpl :: forall a. EffectFn2 String PhaserScene a

foreign import setDataImpl :: forall a. EffectFn3 String a PhaserScene Unit

getData :: forall a. String -> PhaserScene -> Effect a
getData key scene = runEffectFn2 getDataImpl key scene

setData :: forall a. String -> a -> PhaserScene -> Effect Unit
setData key data_ scene = runEffectFn3 setDataImpl key data_ scene

-- | TODO: make these methods return the Scene itself
foreign import removeImpl :: EffectFn1 PhaserScene Unit

remove :: PhaserScene -> Effect Unit
remove = runEffectFn1 removeImpl

foreign import launchImpl :: forall model. EffectFn2 PhaserScene model Unit

foreign import startImpl :: forall model. EffectFn2 model PhaserScene Unit

foreign import restartImpl :: forall model. EffectFn2 PhaserScene model Unit

foreign import pauseImpl :: EffectFn1 PhaserScene Unit

pause :: PhaserScene -> Effect Unit
pause = runEffectFn1 pauseImpl

foreign import resumeImpl :: EffectFn1 PhaserScene Unit

resume :: PhaserScene -> Effect Unit
resume = runEffectFn1 resumeImpl

foreign import sleepImpl :: EffectFn1 PhaserScene Unit

sleep :: PhaserScene -> Effect Unit
sleep = runEffectFn1 sleepImpl

foreign import wakeImpl :: EffectFn1 PhaserScene Unit

wake :: PhaserScene -> Effect Unit
wake = runEffectFn1 wakeImpl

foreign import switchImpl :: EffectFn1 PhaserScene Unit

switch :: PhaserScene -> Effect Unit
switch = runEffectFn1 switchImpl

foreign import runImpl :: EffectFn1 PhaserScene Unit

run :: PhaserScene -> Effect Unit
run = runEffectFn1 runImpl

foreign import stopImpl :: EffectFn1 PhaserScene Unit

stop :: PhaserScene -> Effect Unit
stop = runEffectFn1 stopImpl

foreign import setVisibleImpl :: EffectFn1 PhaserScene Unit

setVisible :: PhaserScene -> Effect Unit
setVisible = runEffectFn1 setVisibleImpl

-- Comprehensive event list
-- https://rexrainbow.github.io/phaser3-rex-notes/docs/site/scene/
foreign import setEventImpl :: EffectFn3 String (Unit -> Effect Unit) PhaserScene Unit

foreign import setTimedEvent :: EffectFn3 String (Time -> Delta -> Effect Unit) PhaserScene Unit

foreign import setGameObjectEvent :: EffectFn2 String (PhaserGameObject -> PhaserScene -> Effect Unit) Unit

-- | Starts the given scene in parallel with the current one
launch :: forall a. PhaserScene -> a -> Effect Unit
launch = runEffectFn2 launchImpl

launchByKey :: forall a. String -> a -> PhaserScene -> Effect Unit
launchByKey = runEffectFn3 launchByKeyImpl

startByKey :: forall a. String -> a -> PhaserScene -> Effect Unit
startByKey = runEffectFn3 startByKeyImpl

removeByKey :: String -> PhaserScene -> Effect Unit
removeByKey = runEffectFn2 removeByKeyImpl

foreign import launchByKeyImpl :: forall a. EffectFn3 String a PhaserScene Unit

foreign import startByKeyImpl :: forall a. EffectFn3 String a PhaserScene Unit

foreign import removeByKeyImpl :: EffectFn2 String PhaserScene Unit

foreign import getPluginInstanceImpl :: forall a. EffectFn2 PhaserScene String a

getPluginInstance :: forall a. PhaserScene -> String -> Effect a
getPluginInstance = runEffectFn2 getPluginInstanceImpl

start :: forall a. a -> PhaserScene -> Effect Unit
start = runEffectFn2 startImpl

restart :: forall a. PhaserScene -> a -> Effect Unit
restart scene a = runEffectFn2 restartImpl scene a

setEvent_ :: String -> (Unit -> Effect Unit) -> PhaserScene -> Effect Unit
setEvent_ = runEffectFn3 setEventImpl

setTimedEvent_ :: String -> (Number -> Number -> Effect Unit) -> PhaserScene -> Effect Unit
setTimedEvent_ = runEffectFn3 setTimedEvent

setEvent :: SceneEvent -> PhaserScene -> Effect Unit
setEvent event = case event of
  Start fn -> setEvent_ "start" fn
  PreUpdate fn -> setTimedEvent_ "preupdate" fn
  Update fn -> setTimedEvent_ "update" fn
  PostUpdate fn -> setTimedEvent_ "postupdate" fn
  Render fn -> setEvent_ "render" fn
  Pause fn -> setEvent_ "pause" fn
  Resume fn -> setEvent_ "resume" fn
  Sleep fn -> setEvent_ "sleep" fn
  Wake fn -> setEvent_ "wake" fn
  ShutDown fn -> setEvent_ "shutdown" fn
  Destroy fn -> setEvent_ "destroy" fn
  Resize fn -> setEvent_ "resize" fn
  Boot fn -> setEvent_ "boot" fn

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
