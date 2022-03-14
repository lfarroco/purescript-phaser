module Graphics.Phaser.Scene where


import Data.Maybe (Maybe)
import Effect (Effect)
import Graphics.Phaser.CoreTypes (class GameObject)
import Graphics.Phaser.ForeignTypes (NodeEventEmitter, PhaserScene)
import Utils.FFI (get, method0, method1, method2, return1, safeGet)

-- Current time in milliseconds
type Time
  = Number

-- Milliseconds since the last frame
type Delta
  = Number

children :: forall a. GameObject a => PhaserScene -> Effect (Array a)
children = get "children.list"

getChildByName :: forall a. GameObject a => String -> PhaserScene -> Effect (Maybe a)
getChildByName  = safeGet

getEventEmitter :: PhaserScene -> Effect NodeEventEmitter
getEventEmitter = get "events"

getData :: forall a. String -> PhaserScene -> Effect a
getData = return1 "getData(v1)"

setData :: forall k v. k -> v -> PhaserScene -> Effect PhaserScene
setData = do method2 "data.set(v1,v2)"

getPluginInstance :: forall a. String -> PhaserScene -> Effect a
getPluginInstance = get

launch :: forall data'. String -> data' -> PhaserScene -> Effect PhaserScene
launch = method2 "scene.launch(v1,v2)"

start :: forall data'. String -> data' -> PhaserScene -> Effect PhaserScene
start = method2 "scene.start(v1, v2)"

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
