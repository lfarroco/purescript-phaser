module Graphics.Phaser.GameConfig where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Options (Options, opt, optional, options, (:=))
import Graphics.Canvas (CanvasElement, Context2D)
import Graphics.Phaser.CoreTypes (ArcadeWorldConfig)
import Graphics.Phaser.ForeignTypes (BootCallback, PhaserScene, WebGLPipeline)
import Internal.Utils (_opt)
import Web.HTML (HTMLElement)

data GameConfig

height :: Number -> Options GameConfig
height = _opt "height"

roundPixels :: Boolean -> Options GameConfig
roundPixels = _opt "roundPixels"

scene :: Array PhaserScene -> Options GameConfig
scene = _opt "scene"

seed :: Array String -> Options GameConfig
seed = _opt "seed"

title :: String -> Options GameConfig
title = _opt "title"

version :: String -> Options GameConfig
version = _opt "version"

width :: Number -> Options GameConfig
width = _opt "width"

type_ :: Int -> Options GameConfig
type_ = _opt "type"

zoom :: Number -> Options GameConfig
zoom = _opt "zoom"

parent :: String -> Options GameConfig
parent = _opt "parent"

canvas :: CanvasElement -> Options GameConfig
canvas = _opt "canvas"

canvasStyle :: String -> Options GameConfig
canvasStyle = _opt "canvasStyle"

customEnvironment :: Boolean -> Options GameConfig
customEnvironment = _opt "customEnvironment"

context :: Context2D -> Options GameConfig
context = _opt "context"

url :: String -> Options GameConfig
url = _opt "url"

autofocus :: Boolean -> Options GameConfig
autofocus = _opt "autofocus"

input ::
  { activePointers :: Int
  , gamepad :: Boolean
  , keyboard :: Boolean
  , mouse :: Boolean
  , smoothFactor :: Number
  , touch :: Boolean
  , windowEvents :: Boolean
  } ->
  Options GameConfig
input = _opt "input"

disableContextMenu :: Boolean -> Options GameConfig
disableContextMenu = _opt "disableContextMenu"

banner ::
  { background :: Array String
  , hidePhaser :: Boolean
  , text :: String
  } ->
  Options GameConfig
banner = _opt "banner"

dom ::
  { behindCanvas :: Boolean
  , createContainer :: Boolean
  , pointerEvents :: String
  } ->
  Options GameConfig
dom = _opt "dom"

fps ::
  { deltaHistory :: Int
  , forceSetTimeOut :: Boolean
  , min :: Int
  , panicMax :: Int
  , smoothStep :: Boolean
  , target :: Int
  } ->
  Options GameConfig
fps = _opt "fps"

render ::
  { antialias :: Boolean
  , antialiasGL :: Boolean
  , batchSize :: Int
  , clearBeforeRender :: Boolean
  , desynchronized :: Boolean
  , failIfMajorPerformanceCaveat :: Boolean
  , maxLights :: Int
  , maxTextures :: Int
  , mipmapFilter :: String
  , pixelArt :: Boolean
  , powerPreference :: String
  , premultipliedAlpha :: Boolean
  , preserveDrawingBuffer :: Boolean
  , roundPixels :: Boolean
  , transparent :: Boolean
  } ->
  Options GameConfig
render = _opt "render"

callbacks ::
  { postBoot :: BootCallback
  , preBoot :: BootCallback
  } ->
  Options GameConfig
callbacks = _opt "callbacks"

loader ::
  { async :: Boolean
  , baseURL :: String
  , crossOrigin :: String
  , maxParallelDownloads :: Int
  , password :: String
  , path :: String
  , responseType :: String
  , timeout :: Int
  , user :: String
  } ->
  Options GameConfig
loader = _opt "loader"

images ::
  { default :: String
  , missing :: String
  , white :: String
  } ->
  Options GameConfig
images = _opt "images"


data PluginObject

global :: (Array PluginObjectItem) -> Options PluginObject
global = _opt "global"

pluginObjectScene :: Array (Options PluginObjectItem) -> Options PluginObject
pluginObjectScene arr = optional (opt "scene") := Just (map options arr)

pluginObjectDefault :: Array String -> Options PluginObject
pluginObjectDefault = _opt "default"

defaultMerge :: Array String -> Options PluginObject
defaultMerge = _opt "defaultMerge"

data PluginObjectItem

pluginKey :: String -> Options PluginObjectItem
pluginKey = _opt "key"

pluginObject :: forall plugin_. plugin_ -> Options PluginObjectItem
pluginObject = _opt "plugin"

pluginStart :: Boolean -> Options PluginObjectItem
pluginStart = _opt "start"

pluginSystemKey :: String -> Options PluginObjectItem
pluginSystemKey = _opt "systemKey"

pluginSceneKey :: String -> Options PluginObjectItem
pluginSceneKey = _opt "sceneKey"

pluginMapping :: String -> Options PluginObjectItem
pluginMapping = _opt "mapping"

pluginData :: forall pluginData_. pluginData_ -> Options PluginObjectItem
pluginData = _opt "data"

plugins :: Options PluginObject -> Options GameConfig
plugins a = optional (opt "plugins") := Just (options a)

scale ::
  { autoCenter :: Int
  , autoRound :: Boolean
  , expandParent :: Boolean
  , height :: Int
  , max :: Int
  , min :: Int
  , mode :: Int
  , parent :: HTMLElement
  , resizeInterval :: Int
  , width :: Int
  , zoom :: Number
  } ->
  Options GameConfig
scale = _opt "scale"

audio :: Boolean -> Options GameConfig
audio = _opt "audio"

pipeline ::
  { name :: String
  , pipeline :: WebGLPipeline
  } ->
  Options GameConfig
pipeline = _opt "pipeline"

backgroundColor :: Int -> Options GameConfig
backgroundColor = _opt "backgroundColor"

antialias :: Boolean -> Options GameConfig
antialias = _opt "antialias"

antialiasGL :: Boolean -> Options GameConfig
antialiasGL = _opt "antialiasGL"

desynchronized :: Boolean -> Options GameConfig
desynchronized = _opt "desynchronized"

pixelArt :: Boolean -> Options GameConfig
pixelArt = _opt "pixelArt"

transparent :: Boolean -> Options GameConfig
transparent = _opt "transparent"

clearBeforeRender :: Boolean -> Options GameConfig
clearBeforeRender = _opt "clearBeforeRender"

preserveDrawingBuffer :: Boolean -> Options GameConfig
preserveDrawingBuffer = _opt "preserveDrawingBuffer"

premultipliedAlpha :: Boolean -> Options GameConfig
premultipliedAlpha = _opt "premultipliedAlpha"

failIfMajorPerformanceCaveat :: Boolean -> Options GameConfig
failIfMajorPerformanceCaveat = _opt "failIfMajorPerformanceCaveat"

powerPreference :: String -> Options GameConfig
powerPreference = _opt "powerPreference"

batchSize :: Number -> Options GameConfig
batchSize = _opt "batchSize"

maxLights :: Number -> Options GameConfig
maxLights = _opt "maxLights"

maxTextures :: Number -> Options GameConfig
maxTextures = _opt "maxTextures"

mipmapFilter :: String -> Options GameConfig
mipmapFilter = _opt "mipmapFilter"

type InputConfig
  = { keyboard :: Boolean
    , mouse :: Boolean
    , touch :: Boolean
    , gamepad :: Boolean
    , activePointers :: Int
    , smoothFactor :: Number
    , windowEvents :: Boolean
    }

type BannerConfig
  = { hidePhaser :: Boolean
    , text :: String
    , background :: Array String
    }

physics :: Options PhysicsConfig -> Options GameConfig
physics a = optional (opt "physics") := (Just $ options a)

type PipelineConfig
  = { name :: String
    , pipeline :: WebGLPipeline
    }

defaultConfig :: Options GameConfig
defaultConfig = mempty

data PhysicsConfig

defaultPhysicsConfig :: String -> Options PhysicsConfig
defaultPhysicsConfig = _opt "default"

arcade :: ArcadeWorldConfig -> Options PhysicsConfig
arcade = _opt "arcade"
