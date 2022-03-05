module Graphics.Phaser.Scene
  ( getData
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
  -- , setVisible
  -- , setEvent
  -- , setTimedEvent
  -- , setGameObjectEvent
  -- , launch
  -- , launchByKey
  -- , startByKey
  -- , removeByKey
  -- , getPluginInstance
  -- , SceneEvent
  , Time
  , Delta
  , class DataEnabled
  ) where

-- TODO: add scene.data, and support for scene.data events

import Prelude

import Data.Foreign.EasyFFI as FFI
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserScene)
import Graphics.Phaser.GameObject (class GameObject)

-- Current time in milliseconds
type Time
  = Number

-- Milliseconds since the last frame
type Delta
  = Number

class DataEnabled :: forall k. k -> Constraint
class GameObject a <= DataEnabled a

enableData :: forall a b. GameObject a => DataEnabled b => a -> Effect b
enableData = FFI.unsafeForeignFunction [ "obj" ] "obj.setDataEnabled(); return obj;"

getData :: forall a. DataEnabled a => PhaserScene -> Effect a -- todo: make nullable
getData = FFI.unsafeForeignFunction [ "scene", "key" ] "scene.getData(key)"

setData :: forall a k v. DataEnabled a => PhaserScene -> k -> v -> Effect PhaserScene -- todo: make nullable
setData scene k v = do
  _ <- FFI.unsafeForeignFunction [ "scene", "key", "value" ] "scene.data.set(key, value)" k v scene
  pure scene

--return obj.data.set(key, data);
getPluginInstance :: forall a. PhaserScene -> Effect a -- todo: make nullable
getPluginInstance = FFI.unsafeForeignFunction [ "scene", "key" ] "scene[key]"

class EventCapable :: forall k. k -> Constraint
class GameObject  a <= EventCapable a

onEvent :: forall listenerFn. String -> listenerFn -> PhaserScene -> Effect PhaserScene
onEvent key listener scene = do
  _ <- FFI.unsafeForeignFunction [ "key", "listener", "scene" ] "scene.on(key, listener)"
  pure scene

onceEvent :: forall listenerFn. String -> listenerFn -> PhaserScene -> Effect PhaserScene
onceEvent key listener scene = do
  _ <- FFI.unsafeForeignFunction [ "key", "listener", "scene" ] "scene.once(key, listener)"
  pure scene

removeListener :: forall listenerFn. String -> listenerFn -> PhaserScene -> Effect PhaserScene
removeListener key listener scene = do
  _ <- FFI.unsafeForeignFunction [ "key", "listener", "scene" ] "scene.once(key, listener)"
  pure scene

offEvent :: String -> PhaserScene -> Effect PhaserScene
offEvent key scene = do
  _ <- FFI.unsafeForeignFunction [ "key", "scene" ] "scene.off(key)"
  pure scene

removeAllListeners :: String -> PhaserScene -> Effect PhaserScene
removeAllListeners key scene = do
  _ <- FFI.unsafeForeignFunction [ "key", "scene" ] "scene.off(key)"
  pure scene

remove :: forall t84. t84
remove = FFI.unsafeForeignFunction [ "scene" ] "scene.scene.remove(scene)"

launch :: forall t108. t108
launch = FFI.unsafeForeignFunction [ "scene", "data" ] "scene.launch(data)"

start :: forall t45. t45
start = FFI.unsafeForeignFunction [ "scene", "data" ] "scene.scene.start(scene, data)"

startByKey :: forall t43. t43
startByKey = FFI.unsafeForeignFunction [ "scene", "key", "data" ] "scene.scene.start(key, data)"

restart :: forall t67. t67
restart = FFI.unsafeForeignFunction [ "scene", "data" ] "scene.scene.restart(scene, data)"

pause :: forall t86. t86
pause = FFI.unsafeForeignFunction [ "scene" ] "scene.scene.pause(scene)"

resume :: forall t65. t65
resume = FFI.unsafeForeignFunction [ "scene" ] "scene.scene.resume(scene)"

sleep :: forall t47. t47
sleep = FFI.unsafeForeignFunction [ "scene" ] "scene.scene.sleep(scene)"

wake :: forall t37. t37
wake = FFI.unsafeForeignFunction [ "scene" ] "scene.scene.wake(scene)"

switch :: forall t39. t39
switch = FFI.unsafeForeignFunction [ "scene" ] "scene.scene.switch(scene)"

stop :: forall t41. t41
stop = FFI.unsafeForeignFunction [ "scene" ] "scene.scene.switch(scene)"

run :: forall t63. t63
run = FFI.unsafeForeignFunction [ "scene", "data" ] "scene.scene.run(scene, data)"

removeByKey :: forall t76. t76
removeByKey = FFI.unsafeForeignFunction [ "scene", "key" ] "scene.scene.remove(key)"

-- foreign import startImpl :: forall model. EffectFn2 model PhaserScene Unit

-- foreign import restartImpl :: forall model. EffectFn2 PhaserScene model Unit

-- foreign import pauseImpl :: EffectFn1 PhaserScene Unit

-- pause :: PhaserScene -> Effect Unit
-- pause = runEffectFn1 pauseImpl

-- foreign import resumeImpl :: EffectFn1 PhaserScene Unit

-- resume :: PhaserScene -> Effect Unit
-- resume = runEffectFn1 resumeImpl

-- foreign import sleepImpl :: EffectFn1 PhaserScene Unit

-- sleep :: PhaserScene -> Effect Unit
-- sleep = runEffectFn1 sleepImpl

-- foreign import wakeImpl :: EffectFn1 PhaserScene Unit

-- wake :: PhaserScene -> Effect Unit
-- wake = runEffectFn1 wakeImpl

-- foreign import switchImpl :: EffectFn1 PhaserScene Unit

-- switch :: PhaserScene -> Effect Unit
-- switch = runEffectFn1 switchImpl

-- foreign import runImpl :: EffectFn1 PhaserScene Unit

-- run :: PhaserScene -> Effect Unit
-- run = runEffectFn1 runImpl

-- foreign import stopImpl :: EffectFn1 PhaserScene Unit

-- stop :: PhaserScene -> Effect Unit
-- stop = runEffectFn1 stopImpl

-- foreign import setVisibleImpl :: EffectFn1 PhaserScene Unit

-- setVisible :: PhaserScene -> Effect Unit
-- setVisible = runEffectFn1 setVisibleImpl

-- -- Comprehensive event list
-- -- https://rexrainbow.github.io/phaser3-rex-notes/docs/site/scene/
-- foreign import setEventImpl :: EffectFn3 String (Unit -> Effect Unit) PhaserScene Unit

-- foreign import setTimedEvent :: EffectFn3 String (Time -> Delta -> Effect Unit) PhaserScene Unit

-- foreign import setGameObjectEvent :: EffectFn2 String (PhaserGameObject -> PhaserScene -> Effect Unit) Unit




-- foreign import removeByKeyImpl :: EffectFn2 String PhaserScene Unit

-- foreign import getPluginInstanceImpl :: forall a. EffectFn2 PhaserScene String a

-- getPluginInstance :: forall a. PhaserScene -> String -> Effect a
-- getPluginInstance = runEffectFn2 getPluginInstanceImpl

-- start :: forall a. a -> PhaserScene -> Effect Unit
-- start = runEffectFn2 startImpl

-- restart :: forall a. PhaserScene -> a -> Effect Unit
-- restart scene a = runEffectFn2 restartImpl scene a

-- setEvent_ :: String -> (Unit -> Effect Unit) -> PhaserScene -> Effect Unit
-- setEvent_ = runEffectFn3 setEventImpl

-- setTimedEvent_ :: String -> (Number -> Number -> Effect Unit) -> PhaserScene -> Effect Unit
-- setTimedEvent_ = runEffectFn3 setTimedEvent

-- setEvent :: SceneEvent -> PhaserScene -> Effect Unit
-- setEvent event = case event of
--   Start fn -> setEvent_ "start" fn
--   PreUpdate fn -> setTimedEvent_ "preupdate" fn
--   Update fn -> setTimedEvent_ "update" fn
--   PostUpdate fn -> setTimedEvent_ "postupdate" fn
--   Render fn -> setEvent_ "render" fn
--   Pause fn -> setEvent_ "pause" fn
--   Resume fn -> setEvent_ "resume" fn
--   Sleep fn -> setEvent_ "sleep" fn
--   Wake fn -> setEvent_ "wake" fn
--   ShutDown fn -> setEvent_ "shutdown" fn
--   Destroy fn -> setEvent_ "destroy" fn
--   Resize fn -> setEvent_ "resize" fn
--   Boot fn -> setEvent_ "boot" fn

-- -- AddedToScene fn -> setGameObjectEvent "addedtoscene" fn 
-- -- RemovedFromScene fn -> setGameObjectEvent "removedfromscene" fn 
-- data SceneEvent
--   = Start (Unit -> Effect Unit)
--   -- Every tick
--   | PreUpdate (Time -> Delta -> Effect Unit)
--   | Update (Time -> Delta -> Effect Unit)
--   | PostUpdate (Time -> Delta -> Effect Unit)
--   | Render (Unit -> Effect Unit)
--   -- State changed
--   | Pause (Unit -> Effect Unit)
--   | Resume (Unit -> Effect Unit)
--   | Sleep (Unit -> Effect Unit)
--   | Wake (Unit -> Effect Unit)
--   | ShutDown (Unit -> Effect Unit)
--   -- Other events
--   | Destroy (Unit -> Effect Unit)
--   | Resize (Unit -> Effect Unit)
--   | Boot (Unit -> Effect Unit)

-- -- Game Object added to scene
-- | AddedToScene (PhaserGameObject -> PhaserScene -> Effect Unit)
-- | RemovedFromScene (PhaserGameObject -> PhaserScene -> Effect Unit)
