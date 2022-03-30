module Graphics.Phaser.Scene
  ( add
  , bringToTop
  , children
  , getChildByName
  , getData
  , getIndex
  , getKey
  , getPhysicsPlugin
  , getPluginInstance
  , getScene
  , getScenePlugin
  , isActive
  , isPaused
  , isSleeping
  , isVisible
  , launch
  , moveAbove
  , moveBelow
  , moveDown
  , moveUp
  , pause
  , remove
  , restart
  , resume
  , run
  , sendToBack
  , setActive
  , setData
  , setVisible
  , sleep
  , start
  , stop
  , swapPosition
  , switch
  , wake
  ) where

-- This File has bindings for the following Phaser classes:
-- Scene - https://photonstorm.github.io/phaser3-docs/Phaser.Scene.html
-- ScenePlugin - https://photonstorm.github.io/phaser3-docs/Phaser.Plugins.ScenePlugin.html
-- Note that Phaser Docs discourage calling SceneManager directly - bindings
-- for it are still available for it if you really want to use them
import Prelude
import Data.Maybe (Maybe)
import Data.Nullable (toMaybe)
import Effect (Effect)
import Graphics.Phaser.CoreTypes (class GameObject, class HasScenePlugin, CreateSceneFromObjectConfig)
import Graphics.Phaser.ForeignTypes (PhaserScene, PhaserScenePlugin, PhaserPhysicsPlugin)
import Option (class FromRecord)
import Utils.FFI (getProperty, injectThis, method1, method2, method4, return1, safeGet)

children :: forall a. GameObject a => PhaserScene -> Effect (Array a)
children = getProperty "children.list"

getChildByName :: forall a. GameObject a => String -> PhaserScene -> Effect (Maybe a)
getChildByName = safeGet

getData :: forall a. String -> PhaserScene -> Effect a
getData = return1 "getData(v1)"

setData :: forall k v. k -> v -> PhaserScene -> Effect PhaserScene
setData = do method2 "data.set(v1,v2)"

getPluginInstance :: forall a. String -> PhaserScene -> Effect a
getPluginInstance = getProperty

getKey :: PhaserScene -> Effect String
getKey = getProperty "key"

-- ScenePlugin bindings
-- https://photonstorm.github.io/phaser3-docs/Phaser.Scenes.ScenePlugin.html
getScenePlugin :: forall a. HasScenePlugin a => a -> Effect PhaserScenePlugin
getScenePlugin = getProperty "scene"

getPhysicsPlugin :: PhaserScene -> Effect PhaserPhysicsPlugin
getPhysicsPlugin = getProperty "physics"

add ::
  forall config sceneData.
  FromRecord config () CreateSceneFromObjectConfig =>
  String ->
  Record config ->
  Boolean ->
  sceneData ->
  PhaserScenePlugin ->
  Effect PhaserScenePlugin
add key config autoStart sceneData scenePlugin = method4 "add(v1,v2,v3,v4)" key (injectThis config) autoStart sceneData scenePlugin

bringToTop :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
bringToTop = method1 "bringToTop(v1)"

getScene :: String -> PhaserScenePlugin -> Effect (Maybe PhaserScene)
getScene key plugin = do
  v <- return1 "getProperty(v1)" key plugin
  pure $ toMaybe v

getIndex :: String -> PhaserScenePlugin -> Effect Number
getIndex = return1 "getIndex(v1)"

isActive :: String -> PhaserScenePlugin -> Effect Boolean
isActive = return1 "isActive(v1)"

isPaused :: String -> PhaserScenePlugin -> Effect Boolean
isPaused = return1 "isPaused(v1)"

isSleeping :: String -> PhaserScenePlugin -> Effect Boolean
isSleeping = return1 "isSleeping(v1)"

isVisible :: String -> PhaserScenePlugin -> Effect Boolean
isVisible = return1 "isVisible(v1)"

launch :: forall sceneData. String -> sceneData -> PhaserScenePlugin -> Effect PhaserScenePlugin
launch = method2 "launch(v1,v2)"

moveAbove :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
moveAbove = method1 "moveAbove(v1)"

moveBelow :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
moveBelow = method1 "moveBelow(v1)"

moveDown :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
moveDown = method1 "moveDown(v1)"

moveUp :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
moveUp = method1 "moveUp(v1)"

pause :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
pause = method1 "pause(v1)"

remove :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
remove = method1 "remove(v1)"

restart :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
restart = method1 "restart(v1)"

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
sleep = method1 "sleep(v1)"

start :: forall sceneData. String -> sceneData -> PhaserScenePlugin -> Effect PhaserScenePlugin
start = method2 "start(v1,v2)"

stop :: forall sceneData. String -> sceneData -> PhaserScenePlugin -> Effect PhaserScenePlugin
stop = method2 "stop(v1,v2)"

swapPosition :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
swapPosition = method1 "swapPosition(v1)"

switch :: String -> PhaserScenePlugin -> Effect PhaserScenePlugin
switch = method1 "switch(v1)"

-- TODO: add transition
wake :: forall sceneData. String -> sceneData -> PhaserScenePlugin -> Effect PhaserScenePlugin
wake = method2 "wake(v1,v2)"
