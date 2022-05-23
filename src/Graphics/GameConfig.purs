module Graphics.Phaser.GameConfig where

import Prelude
import Data.Maybe (Maybe)
import Data.Options (Option, Options, opt, optional)
import Graphics.Canvas (CanvasElement, Context2D)
import Graphics.Phaser.CoreTypes (CallbacksConfig, DOMContainerConfig, FPSConfig, ImagesConfig, LoaderConfig, PhysicsConfig, PluginObject, RenderConfig, ScaleConfig, AudioConfig)
import Graphics.Phaser.ForeignTypes (PhaserScene, WebGLPipeline)

data GameConfig

width :: Option GameConfig (Maybe Number)
width = optional (opt "width")

height :: Option GameConfig (Maybe Number)
height = optional (opt "height")

type_ :: Option GameConfig (Maybe Int)
type_ = optional (opt "type")

zoom :: Option GameConfig (Maybe Number)
zoom = optional (opt "zoom")

parent :: Option GameConfig (Maybe String)
parent = optional (opt "parent")

canvas :: Option GameConfig (Maybe CanvasElement)
canvas = optional (opt "canvas")

canvasStyle :: Option GameConfig (Maybe String)
canvasStyle = optional (opt "canvasStyle")

customEnvironment :: Option GameConfig (Maybe Boolean)
customEnvironment = optional (opt "customEnvironment")

context :: Option GameConfig (Maybe Context2D)
context = optional (opt "context")

scene :: Option GameConfig (Maybe (Array PhaserScene))
scene = optional (opt "scene")

seed :: Option GameConfig (Maybe (Array String))
seed = optional (opt "seed")

title :: Option GameConfig (Maybe String)
title = optional (opt "title")

url :: Option GameConfig (Maybe String)
url = optional (opt "url")

version :: Option GameConfig (Maybe String)
version = optional (opt "version")

autofocus :: Option GameConfig (Maybe Boolean)
autofocus = optional (opt "autofocus")

input :: Option GameConfig (Maybe InputConfig)
input = optional (opt "input")

type InputConfig
  = { keyboard :: Boolean
    , mouse :: Boolean
    , touch :: Boolean
    , gamepad :: Boolean
    , activePointers :: Int
    , smoothFactor :: Number
    , windowEvents :: Boolean
    }

disableContextMenu :: Option GameConfig (Maybe Boolean)
disableContextMenu = optional (opt "disableContextMenu")

banner :: Option GameConfig (Maybe BannerConfig)
banner = optional (opt "banner")

type BannerConfig
  = { hidePhaser :: Boolean
    , text :: String
    , background :: Array String
    }

dom :: Option GameConfig (Maybe DOMContainerConfig)
dom = optional (opt "dom")

fps :: Option GameConfig (Maybe FPSConfig)
fps = optional (opt "fps")

render :: Option GameConfig (Maybe RenderConfig)
render = optional (opt "render")

callbacks :: Option GameConfig (Maybe CallbacksConfig)
callbacks = optional (opt "callbacks")

loader :: Option GameConfig (Maybe LoaderConfig)
loader = optional (opt "loader")

images :: Option GameConfig (Maybe ImagesConfig)
images = optional (opt "images")

physics :: Option GameConfig (Maybe PhysicsConfig)
physics = optional (opt "physics")

plugins :: Option GameConfig (Maybe PluginObject)
plugins = optional (opt "plugins")

scale :: Option GameConfig (Maybe ScaleConfig)
scale = optional (opt "scale")

audio :: Option GameConfig (Maybe AudioConfig)
audio = optional (opt "scale")

pipeline :: Option GameConfig (Maybe PipelineConfig)
pipeline = optional (opt "pipeline")

type PipelineConfig
  = { name :: String
    , pipeline :: WebGLPipeline
    }

backgroundColor :: Option GameConfig (Maybe Int)
backgroundColor = optional (opt "backgroundColor")

antialias :: Option GameConfig (Maybe Boolean)
antialias = optional (opt "antialias")

antialiasGL :: Option GameConfig (Maybe Boolean)
antialiasGL = optional (opt "antialiasGL")

desynchronized :: Option GameConfig (Maybe Boolean)
desynchronized = optional (opt "desynchronized")

pixelArt :: Option GameConfig (Maybe Boolean)
pixelArt = optional (opt "pixelArt")

roundPixels :: Option GameConfig (Maybe Boolean)
roundPixels = optional (opt "roundPixels")

transparent :: Option GameConfig (Maybe Boolean)
transparent = optional (opt "transparent")

clearBeforeRender :: Option GameConfig (Maybe Boolean)
clearBeforeRender = optional (opt "clearBeforeRender")

preserveDrawingBuffer :: Option GameConfig (Maybe Boolean)
preserveDrawingBuffer = optional (opt "preserveDrawingBuffer")

premultipliedAlpha :: Option GameConfig (Maybe Boolean)
premultipliedAlpha = optional (opt "premultipliedAlpha")

failIfMajorPerformanceCaveat :: Option GameConfig (Maybe Boolean)
failIfMajorPerformanceCaveat = optional (opt "failIfMajorPerformanceCaveat")

powerPreference :: Option GameConfig (Maybe String)
powerPreference = optional (opt "powerPreference")

batchSize :: Option GameConfig (Maybe Number)
batchSize = optional (opt "batchSize")

maxLights :: Option GameConfig (Maybe Number)
maxLights = optional (opt "maxLights")

maxTextures :: Option GameConfig (Maybe Number)
maxTextures = optional (opt "maxTextures")

mipmapFilter :: Option GameConfig (Maybe String)
mipmapFilter = optional (opt "mipmapFilter")

defaultConfig :: Options GameConfig
defaultConfig = mempty
