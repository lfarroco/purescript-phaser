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
  , launch
  , getPluginInstance
  , on
  , once
  , off
  , removeListener
  , removeAllListeners
  , Time
  , Delta
  ) where


import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserScene)
import Utils.FFI (get, method0, method1, method2, return1)

-- Current time in milliseconds
type Time
  = Number

-- Milliseconds since the last frame
type Delta
  = Number

getData :: forall a. String -> PhaserScene -> Effect a
getData = return1 "getData(v1)"

setData :: forall k v. k -> v -> PhaserScene -> Effect PhaserScene
setData = do method2 "data.set(v1,v2)"

getPluginInstance :: forall a. String -> PhaserScene -> Effect a
getPluginInstance = get

on :: forall listenerFn. String -> listenerFn -> PhaserScene -> Effect PhaserScene
on = method2 "on(v1,v2)"

once :: forall listenerFn. String -> listenerFn -> PhaserScene -> Effect PhaserScene
once = method2 "once(v1,v2)"

off:: String -> PhaserScene -> Effect PhaserScene
off= method1 "off(v1)"

removeListener :: forall listenerFn. listenerFn -> PhaserScene -> Effect PhaserScene
removeListener = method1 "removeListener(v1)"

removeAllListeners ::PhaserScene -> Effect PhaserScene
removeAllListeners = method0 "removeAllListeners()"

launch :: forall data'. String -> data' -> PhaserScene -> Effect PhaserScene
launch = method2 "scene.launch(v1,v2)"

start  :: forall data'. String -> data' -> PhaserScene -> Effect PhaserScene
start  = method2 "scene.start(v1, v2)"

restart :: forall data'. data' -> PhaserScene -> Effect PhaserScene
restart = method1 "scene.restart(v1)"

pause :: PhaserScene -> Effect PhaserScene
pause = method0 "scene.pause(obj)"

resume :: PhaserScene -> Effect PhaserScene
resume = method0 "scene.resume(obj)"

sleep :: PhaserScene -> Effect PhaserScene
sleep = method0 "scene.sleep(obj)"

wake :: PhaserScene -> Effect PhaserScene
wake = method0 "scene.wake(obj)"

switch :: PhaserScene -> PhaserScene -> Effect PhaserScene
switch = method1 "scene.switch(v1)"

stop :: PhaserScene -> Effect PhaserScene
stop = method0 "scene.stop(obj)"

run :: forall a. PhaserScene -> a -> PhaserScene -> Effect PhaserScene
run = method2 "scene.run(v1, v2)"

remove :: String -> PhaserScene -> Effect PhaserScene
remove = method1 "scene.remove(v1)"

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
--   | AddedToScene (PhaserGameObject -> PhaserScene -> Effect Unit)
--   | RemovedFromScene (PhaserGameObject -> PhaserScene -> Effect Unit)
