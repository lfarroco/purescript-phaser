module Graphics.Phaser.GameConfig where

import Prelude
import Data.Maybe (Maybe(..))
import Data.Options (Options, opt, optional, options, (:=))
import Graphics.Canvas (CanvasElement, Context2D)
import Graphics.Phaser.CoreTypes (AudioConfig, CallbacksConfig, DOMContainerConfig, FPSConfig, ImagesConfig, LoaderConfig, PluginObject, RenderConfig, ScaleConfig, ArcadeWorldConfig)
import Graphics.Phaser.ForeignTypes (PhaserScene, WebGLPipeline)

data GameConfig

opt_ :: forall a b. String -> a -> Options b
opt_ attr val = optional (opt attr) := Just val

width :: Number -> Options GameConfig
width = opt_ "width"

height :: Number -> Options GameConfig
height = opt_ "height"

type_ :: Int -> Options GameConfig
type_ = opt_ "type"

zoom :: Number -> Options GameConfig
zoom = opt_ "zoom"

parent :: String -> Options GameConfig
parent = opt_ "parent"

canvas :: CanvasElement -> Options GameConfig
canvas = opt_ "canvas"

canvasStyle :: String -> Options GameConfig
canvasStyle = opt_ "canvasStyle"

customEnvironment :: Boolean -> Options GameConfig
customEnvironment = opt_ "customEnvironment"

context :: Context2D -> Options GameConfig
context = opt_ "context"

scene :: Array PhaserScene -> Options GameConfig
scene = opt_ "scene"

seed :: Array String -> Options GameConfig
seed = opt_ "seed"

title :: String -> Options GameConfig
title = opt_ "title"

url :: String -> Options GameConfig
url = opt_ "url"

version :: String -> Options GameConfig
version = opt_ "version"

autofocus :: Boolean -> Options GameConfig
autofocus = opt_ "autofocus"

input :: InputConfig -> Options GameConfig
input = opt_ "input"

type InputConfig
  = { keyboard :: Boolean
    , mouse :: Boolean
    , touch :: Boolean
    , gamepad :: Boolean
    , activePointers :: Int
    , smoothFactor :: Number
    , windowEvents :: Boolean
    }

disableContextMenu :: Boolean -> Options GameConfig
disableContextMenu = opt_ "disableContextMenu"

banner :: BannerConfig -> Options GameConfig
banner = opt_ "banner"

type BannerConfig
  = { hidePhaser :: Boolean
    , text :: String
    , background :: Array String
    }

dom :: DOMContainerConfig -> Options GameConfig
dom = opt_ "dom"

fps :: FPSConfig -> Options GameConfig
fps = opt_ "fps"

render :: RenderConfig -> Options GameConfig
render = opt_ "render"

callbacks :: CallbacksConfig -> Options GameConfig
callbacks = opt_ "callbacks"

loader :: LoaderConfig -> Options GameConfig
loader = opt_ "loader"

images :: ImagesConfig -> Options GameConfig
images = opt_ "images"

physics :: Options PhysicsConfig -> Options GameConfig
physics a = optional (opt "physics") := (Just $ options a)

plugins :: PluginObject -> Options GameConfig
plugins = opt_ "plugins"

scale :: ScaleConfig -> Options GameConfig
scale = opt_ "scale"

audio :: AudioConfig -> Options GameConfig
audio = opt_ "scale"

pipeline :: PipelineConfig -> Options GameConfig
pipeline = opt_ "pipeline"

type PipelineConfig
  = { name :: String
    , pipeline :: WebGLPipeline
    }

backgroundColor :: Int -> Options GameConfig
backgroundColor = opt_ "backgroundColor"

antialias :: Boolean -> Options GameConfig
antialias = opt_ "antialias"

antialiasGL :: Boolean -> Options GameConfig
antialiasGL = opt_ "antialiasGL"

desynchronized :: Boolean -> Options GameConfig
desynchronized = opt_ "desynchronized"

pixelArt :: Boolean -> Options GameConfig
pixelArt = opt_ "pixelArt"

roundPixels :: Boolean -> Options GameConfig
roundPixels = opt_ "roundPixels"

transparent :: Boolean -> Options GameConfig
transparent = opt_ "transparent"

clearBeforeRender :: Boolean -> Options GameConfig
clearBeforeRender = opt_ "clearBeforeRender"

preserveDrawingBuffer :: Boolean -> Options GameConfig
preserveDrawingBuffer = opt_ "preserveDrawingBuffer"

premultipliedAlpha :: Boolean -> Options GameConfig
premultipliedAlpha = opt_ "premultipliedAlpha"

failIfMajorPerformanceCaveat :: Boolean -> Options GameConfig
failIfMajorPerformanceCaveat = opt_ "failIfMajorPerformanceCaveat"

powerPreference :: String -> Options GameConfig
powerPreference = opt_ "powerPreference"

batchSize :: Number -> Options GameConfig
batchSize = opt_ "batchSize"

maxLights :: Number -> Options GameConfig
maxLights = opt_ "maxLights"

maxTextures :: Number -> Options GameConfig
maxTextures = opt_ "maxTextures"

mipmapFilter :: String -> Options GameConfig
mipmapFilter = opt_ "mipmapFilter"

defaultConfig :: Options GameConfig
defaultConfig = mempty

data PhysicsConfig

default :: String -> Options PhysicsConfig
default = opt_ "default"

arcade :: ArcadeWorldConfig -> Options PhysicsConfig
arcade = opt_ "arcade"
