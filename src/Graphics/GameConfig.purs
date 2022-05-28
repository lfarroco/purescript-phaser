module Graphics.Phaser.GameConfig (_gameConfig, GameConfig, GameConfigIndex, _physicsConfig, PhysicsConfig, PhysicsConfigIndex) where

import Prelude
import Data.Maybe (Maybe(..))
import Data.Options (Options, opt, optional, options, (:=))
import Graphics.Canvas (CanvasElement, Context2D)
import Graphics.Phaser.CoreTypes (ArcadeWorldConfig)
import Graphics.Phaser.ForeignTypes (AudioContext, BootCallback, PhaserScene, PluginObjectItem, WebGLPipeline)
import Web.HTML (HTMLElement)

data GameConfig

type GameConfigIndex
  = { antialias :: Boolean -> Options GameConfig
    , antialiasGL :: Boolean -> Options GameConfig
    , audio ::
        { context :: AudioContext
        , disableWebAudio :: Boolean
        , noAudio :: Boolean
        } ->
        Options GameConfig
    , autofocus :: Boolean -> Options GameConfig
    , backgroundColor :: Int -> Options GameConfig
    , banner ::
        { background :: Array String
        , hidePhaser :: Boolean
        , text :: String
        } ->
        Options GameConfig
    , batchSize :: Number -> Options GameConfig
    , callbacks ::
        { postBoot :: BootCallback
        , preBoot :: BootCallback
        } ->
        Options GameConfig
    , canvas :: CanvasElement -> Options GameConfig
    , canvasStyle :: String -> Options GameConfig
    , clearBeforeRender :: Boolean -> Options GameConfig
    , context :: Context2D -> Options GameConfig
    , customEnvironment :: Boolean -> Options GameConfig
    , default :: Options GameConfig
    , desynchronized :: Boolean -> Options GameConfig
    , disableContextMenu :: Boolean -> Options GameConfig
    , dom ::
        { behindCanvas :: Boolean
        , createContainer :: Boolean
        , pointerEvents :: String
        } ->
        Options GameConfig
    , failIfMajorPerformanceCaveat :: Boolean -> Options GameConfig
    , fps ::
        { deltaHistory :: Int
        , forceSetTimeOut :: Boolean
        , min :: Int
        , panicMax :: Int
        , smoothStep :: Boolean
        , target :: Int
        } ->
        Options GameConfig
    , height :: Number -> Options GameConfig
    , images ::
        { default :: String
        , missing :: String
        , white :: String
        } ->
        Options GameConfig
    , input ::
        { activePointers :: Int
        , gamepad :: Boolean
        , keyboard :: Boolean
        , mouse :: Boolean
        , smoothFactor :: Number
        , touch :: Boolean
        , windowEvents :: Boolean
        } ->
        Options GameConfig
    , loader ::
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
    , maxLights :: Number -> Options GameConfig
    , maxTextures :: Number -> Options GameConfig
    , mipmapFilter :: String -> Options GameConfig
    , parent :: String -> Options GameConfig
    , physics :: Options PhysicsConfig -> Options GameConfig
    , pipeline ::
        { name :: String
        , pipeline :: WebGLPipeline
        } ->
        Options GameConfig
    , pixelArt :: Boolean -> Options GameConfig
    , plugins ::
        { default :: Array String
        , defaultMerge :: Array String
        , global :: Array PluginObjectItem
        , scene :: Array PluginObjectItem
        } ->
        Options GameConfig
    , powerPreference :: String -> Options GameConfig
    , premultipliedAlpha :: Boolean -> Options GameConfig
    , preserveDrawingBuffer :: Boolean -> Options GameConfig
    , render ::
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
    , roundPixels :: Boolean -> Options GameConfig
    , scale ::
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
    , scene :: Array PhaserScene -> Options GameConfig
    , seed :: Array String -> Options GameConfig
    , title :: String -> Options GameConfig
    , transparent :: Boolean -> Options GameConfig
    , type_ :: Int -> Options GameConfig
    , url :: String -> Options GameConfig
    , version :: String -> Options GameConfig
    , width :: Number -> Options GameConfig
    , zoom :: Number -> Options GameConfig
    }

_gameConfig :: GameConfigIndex
_gameConfig =
  { width: opt_ "width"
  , height: opt_ "height"
  , type_: opt_ "type_"
  , zoom: opt_ "zoom"
  , parent: opt_ "parent"
  , canvas: opt_ "canvas"
  , canvasStyle: opt_ "canvasStyle"
  , customEnvironment: opt_ "customEnvironment"
  , context: opt_ "context"
  , scene: opt_ "scene"
  , seed: opt_ "seed"
  , title: opt_ "title"
  , url: opt_ "url"
  , version: opt_ "version"
  , autofocus: opt_ "autofocus"
  , input: opt_ "input"
  , disableContextMenu: opt_ "disableContextMenu"
  , banner: opt_ "banner"
  , dom: opt_ "dom"
  , fps: opt_ "fps"
  , render: opt_ "render"
  , callbacks: opt_ "callbacks"
  , loader: opt_ "loader"
  , images: opt_ "images"
  , physics: physics
  , plugins: opt_ "plugins"
  , scale: opt_ "scale"
  , audio: opt_ "audio"
  , pipeline: opt_ "pipeline"
  , backgroundColor: opt_ "backgroundColor"
  , antialias: opt_ "antialias"
  , antialiasGL: opt_ "antialiasGL"
  , desynchronized: opt_ "desynchronized"
  , pixelArt: opt_ "pixelArt"
  , roundPixels: opt_ "roundPixels"
  , transparent: opt_ "transparent"
  , clearBeforeRender: opt_ "clearBeforeRender"
  , preserveDrawingBuffer: opt_ "preserveDrawingBuffer"
  , premultipliedAlpha: opt_ "premultipliedAlpha"
  , failIfMajorPerformanceCaveat: opt_ "failIfMajorPerformanceCaveat"
  , powerPreference: opt_ "powerPreference"
  , batchSize: opt_ "batchSize"
  , maxLights: opt_ "maxLights"
  , maxTextures: opt_ "maxTextures"
  , mipmapFilter: opt_ "mipmapFilter"
  , default: defaultConfig
  }

opt_ :: forall a b. String -> a -> Options b
opt_ attr val = optional (opt attr) := Just val

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

type PhysicsConfigIndex
  = { arcade ::
        { debug :: Boolean
        , gravity ::
            { x :: Number
            , y :: Number
            }
        } ->
        Options PhysicsConfig
    , default :: String -> Options PhysicsConfig
    }

_physicsConfig :: PhysicsConfigIndex
_physicsConfig =
  { default: defaultPhysicsConfig
  , arcade: arcade
  }

defaultPhysicsConfig :: String -> Options PhysicsConfig
defaultPhysicsConfig = opt_ "default"

arcade :: ArcadeWorldConfig -> Options PhysicsConfig
arcade = opt_ "arcade"
