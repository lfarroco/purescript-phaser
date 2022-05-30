module Graphics.Phaser.Scene where

-- This File has bindings for the following Phaser classes:
-- Scene - https://photonstorm.github.io/phaser3-docs/Phaser.Scene.html
-- ScenePlugin - https://photonstorm.github.io/phaser3-docs/Phaser.Plugins.ScenePlugin.html
-- Note that Phaser Docs discourage calling SceneManager directly - bindings
-- for it are still available for it if you really want to use them
import Prelude
import Data.Foreign.EasyFFI (unsafeForeignProcedure)
import Data.Maybe (Maybe)
import Effect (Effect)
import Graphics.Phaser.CoreTypes (class GameObject, class HasScenePlugin)
import Graphics.Phaser.ForeignTypes (PhaserPhysicsPlugin, PhaserScene, PhaserScenePlugin)
import Utils.FFI (_getProp, _method1, _return1, method2, method4, safeGet)

-- | The lifecycle functions (init, update, create, etc.) require returning PhaserGame to allow
-- | composing multiple functions that operate at that time.
-- | eg. oncreate = drawBackground >=> drawRetangle
newScene :: String -> Effect PhaserScene
newScene = unsafeForeignProcedure [ "key", "" ] "return new Phaser.Scene(key)"

init :: (PhaserScene -> Effect Unit) -> PhaserScene -> Effect PhaserScene
init callback scene = do
  void $ unsafeForeignProcedure [ "callback", "scene", "" ] "scene.init = (data) => callback(scene)()" callback scene
  pure scene

initWithData :: forall a. (a -> PhaserScene -> Effect Unit) -> PhaserScene -> Effect PhaserScene
initWithData callback scene = do
  void $ unsafeForeignProcedure [ "callback", "scene", "" ] "scene.init = (data) => callback(data)(scene)()" callback scene
  pure scene

update :: (PhaserScene -> Effect PhaserScene) -> PhaserScene -> Effect PhaserScene
update callback scene = do
  void $ unsafeForeignProcedure [ "callback", "scene", "" ] "scene.update = (time,delta) => callback(scene)()" callback scene
  pure scene

updateWithTimes :: ({ scene :: PhaserScene, time :: Number, delta :: Number } -> Effect PhaserScene) -> PhaserScene -> Effect PhaserScene
updateWithTimes callback scene = do
  void $ unsafeForeignProcedure [ "callback", "scene", "" ] "scene.update = (time,delta) => callback({time, delta, scene})()" callback scene
  pure scene

create :: (PhaserScene -> Effect PhaserScene) -> PhaserScene -> Effect PhaserScene
create callback scene = do
  void $ unsafeForeignProcedure [ "callback", "scene", "" ] "scene.create = (data) => callback(scene)()" callback scene
  pure scene

createWithData :: forall a. (a -> PhaserScene -> Effect PhaserScene) -> PhaserScene -> Effect PhaserScene
createWithData callback scene = do
  void $ unsafeForeignProcedure [ "callback", "scene", "" ] "scene.create = (data) => callback(data)(scene)()" callback scene
  pure scene

preload :: (PhaserScene -> Effect PhaserScene) -> PhaserScene -> Effect PhaserScene
preload callback scene = do
  void $ unsafeForeignProcedure [ "callback", "scene", "" ] "scene.preload = () => callback(scene)()" callback scene
  pure scene

children :: forall a. GameObject a => PhaserScene -> Effect (Array a)
children = _getProp "children.list"

getChildByName :: forall a. GameObject a => String -> PhaserScene -> Effect (Maybe a)
getChildByName = safeGet

getData :: forall a. String -> PhaserScene -> Effect a
getData = _return1 "getData"

setData :: forall k v. k -> v -> PhaserScene -> Effect PhaserScene
setData = do method2 "data.set(v1,v2)"

getPluginInstance :: forall a. String -> PhaserScene -> Effect a
getPluginInstance = _getProp

getKey :: PhaserScene -> Effect String
getKey = _getProp "key"

-- ScenePlugin bindings
-- https://photonstorm.github.io/phaser3-docs/Phaser.Scenes.ScenePlugin.html
getScenePlugin :: forall a. HasScenePlugin a => a -> Effect PhaserScenePlugin
getScenePlugin = _getProp "scene"

getPhysicsPlugin :: PhaserScene -> Effect PhaserPhysicsPlugin
getPhysicsPlugin = _getProp "physics"

add ::
  forall sceneData.
  String ->
  PhaserScene ->
  Boolean ->
  sceneData ->
  PhaserScenePlugin ->
  Effect PhaserScenePlugin
add key scene autoStart sceneData scenePlugin = method4 "add(v1,v2,v3,v4)" key scene autoStart sceneData scenePlugin

bringToTop :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
bringToTop = _method1 "bringToTop"

-- getScene :: String -> PhaserScenePlugin -> Effect (Maybe PhaserScene)
-- getScene key plugin = do
--   v <- _return1 "scene" key plugin
--   pure $ toMaybe v
getIndex :: String -> PhaserScenePlugin -> Effect Number
getIndex = _return1 "getIndex"

isActive :: String -> PhaserScenePlugin -> Effect Boolean
isActive = _return1 "isActive"

isPaused :: String -> PhaserScenePlugin -> Effect Boolean
isPaused = _return1 "isPaused"

isSleeping :: String -> PhaserScenePlugin -> Effect Boolean
isSleeping = _return1 "isSleeping"

isVisible :: String -> PhaserScenePlugin -> Effect Boolean
isVisible = _return1 "isVisible"

launch :: forall sceneData. String -> sceneData -> PhaserScenePlugin -> Effect PhaserScenePlugin
launch = method2 "launch(v1,v2)"

moveAbove :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
moveAbove = _method1 "moveAbove"

moveBelow :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
moveBelow = _method1 "moveBelow"

moveDown :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
moveDown = _method1 "moveDown"

moveUp :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
moveUp = _method1 "moveUp"

pause :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
pause = _method1 "pause"

remove :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
remove = _method1 "remove"

restart :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
restart = _method1 "restart"

resume :: forall sceneData. String -> sceneData -> PhaserScenePlugin -> Effect PhaserScenePlugin
resume = method2 "resume(v1,v2)"

run :: forall sceneData. String -> sceneData -> PhaserScenePlugin -> Effect PhaserScenePlugin
run = method2 "run(v1,v2)"

sendToBack :: forall sceneData. String -> sceneData -> PhaserScenePlugin -> Effect PhaserScenePlugin
sendToBack = method2 "sendToBack(v1)"

setActive :: Boolean -> String -> PhaserScenePlugin -> Effect PhaserScenePlugin
setActive = method2 "setActive(v1,v2)"

setVisible :: Boolean -> String -> PhaserScenePlugin -> Effect PhaserScenePlugin
setVisible = method2 "setVisible(v1,v2)"

sleep :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
sleep = _method1 "sleep"

start :: forall sceneData. String -> sceneData -> PhaserScenePlugin -> Effect PhaserScenePlugin
start = method2 "start(v1,v2)"

stop :: forall sceneData. String -> sceneData -> PhaserScenePlugin -> Effect PhaserScenePlugin
stop = method2 "stop(v1,v2)"

swapPosition :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
swapPosition = _method1 "swapPosition"

switch :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
switch = _method1 "switch"

-- TODO: add transition
wake :: forall sceneData. String -> sceneData -> PhaserScenePlugin -> Effect PhaserScenePlugin
wake = method2 "wake(v1,v2)"
