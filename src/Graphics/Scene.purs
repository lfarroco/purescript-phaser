module Graphics.Phaser.Scene where

-- This File has bindings for the following Phaser classes:
-- Scene - https://photonstorm.github.io/phaser3-docs/Phaser.Scene.html
-- ScenePlugin - https://photonstorm.github.io/phaser3-docs/Phaser.Plugins.ScenePlugin.html
-- Note that Phaser Docs discourage calling SceneManager directly - bindings
-- for it are still available for it if you really want to use them
import Prelude
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Graphics.Phaser.CoreTypes (class GameObject, class HasScenePlugin)
import Graphics.Phaser.Events (createEventListener1, createEventListener2)
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserPhysicsPlugin, PhaserScene, PhaserScenePlugin)
import Utils.FFI (_getProp, _method1, _method2, _method4, _new1, _return1, _return2, _setProp, phaser, safeGet)

-- | The lifecycle functions (init, update, create, etc.) require returning PhaserGame to allow
-- | composing multiple functions that operate at that time.
-- | eg. oncreate = drawBackground >=> drawRetangle
newScene :: String -> Effect PhaserScene
newScene key = phaser >>= _getProp "Scene" >>= _new1 key

init :: (PhaserScene -> Effect Unit) -> PhaserScene -> Effect PhaserScene
init callback scene = do
  void $ _setProp "init" (callback scene) scene
  pure scene

initWithData :: forall a. (PhaserScene -> a -> Effect Unit) -> PhaserScene -> Effect PhaserScene
initWithData callback scene = do
  void $ _setProp "init" (createEventListener1 (callback scene)) scene
  pure scene

update :: (PhaserScene -> Effect Unit) -> PhaserScene -> Effect PhaserScene
update callback scene = do
  void $ _setProp "update" (callback scene) scene
  pure scene

updateWithTimes :: ({ scene :: PhaserScene, time :: Number, delta :: Number } -> Effect Unit) -> PhaserScene -> Effect PhaserScene
updateWithTimes callback scene = do
  void $ _setProp "update" (createEventListener2 (\time delta -> callback { time, delta, scene })) scene
  pure scene

create :: (PhaserScene -> Effect Unit) -> PhaserScene -> Effect PhaserScene
create callback scene = do
  void $ _setProp "create" (callback scene) scene
  pure scene

createWithData :: forall a. (PhaserScene -> a -> Effect Unit) -> PhaserScene -> Effect PhaserScene
createWithData callback scene = do
  void $ _setProp "create" (callback scene) scene
  pure scene

preload :: (PhaserScene -> Effect Unit) -> PhaserScene -> Effect PhaserScene
preload callback scene = do
  void $ _setProp "preload" (callback scene) scene
  pure scene

children :: forall a. GameObject a => PhaserScene -> Effect (Array a)
children = _getProp "children" >=> _getProp "list"

getChildByName :: forall a. GameObject a => String -> PhaserScene -> Effect (Maybe a)
getChildByName = safeGet

getData :: forall a. String -> PhaserScene -> Effect (Maybe a)
getData key scn = do
  prop <- _getProp "data" scn
  (val :: Nullable a) <- _return1 "get" key prop
  pure $ toMaybe val

setData :: forall k v. k -> v -> PhaserScene -> Effect PhaserScene
setData v1 v2 scn =
  _getProp "data" scn
    >>= _return2 "set" v1 v2
    >>= const (pure scn)

getPluginInstance :: forall a. String -> PhaserScene -> Effect a
getPluginInstance = _getProp

getKey :: PhaserScene -> Effect String
getKey = _getProp "key"

getGame :: PhaserScene -> Effect PhaserGame
getGame = _getProp "game"

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
add = _method4 "add"

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
launch = _method2 "launch"

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
resume = _method2 "resume"

run :: forall sceneData. String -> sceneData -> PhaserScenePlugin -> Effect PhaserScenePlugin
run = _method2 "run"

sendToBack :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
sendToBack = _method1 "sendToBack"

setActive :: Boolean -> String -> PhaserScenePlugin -> Effect PhaserScenePlugin
setActive = _method2 "setActive"

setVisible :: Boolean -> String -> PhaserScenePlugin -> Effect PhaserScenePlugin
setVisible = _method2 "setVisible"

sleep :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
sleep = _method1 "sleep"

start :: forall sceneData. String -> sceneData -> PhaserScenePlugin -> Effect PhaserScenePlugin
start = _method2 "start"

stop :: forall sceneData. String -> sceneData -> PhaserScenePlugin -> Effect PhaserScenePlugin
stop = _method2 "stop"

swapPosition :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
swapPosition = _method1 "swapPosition"

switch :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
switch = _method1 "switch"

-- TODO: add transition
wake :: forall sceneData. String -> sceneData -> PhaserScenePlugin -> Effect PhaserScenePlugin
wake = _method2 "wake"
