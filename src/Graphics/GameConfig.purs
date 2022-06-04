module Graphics.Phaser.GameConfig (_gameConfig, GameConfig, GameConfigIndex, _physicsConfig, PhysicsConfig, PhysicsConfigIndex) where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Options (Options, opt, optional, options, (:=))
import Graphics.Canvas (CanvasElement, Context2D)
import Graphics.Phaser.CoreTypes (ArcadeWorldConfig)
import Graphics.Phaser.ForeignTypes (AudioContext, BootCallback, PhaserScene, PluginObjectItem, WebGLPipeline)
import Internal.Utils (_opt)
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
  { width: _opt "width"
  , height: _opt "height"
  , type_: _opt "type_"
  , zoom: _opt "zoom"
  , parent: _opt "parent"
  , canvas: _opt "canvas"
  , canvasStyle: _opt "canvasStyle"
  , customEnvironment: _opt "customEnvironment"
  , context: _opt "context"
  , scene: _opt "scene"
  , seed: _opt "seed"
  , title: _opt "title"
  , url: _opt "url"
  , version: _opt "version"
  , autofocus: _opt "autofocus"
  , input: _opt "input"
  , disableContextMenu: _opt "disableContextMenu"
  , banner: _opt "banner"
  , dom: _opt "dom"
  , fps: _opt "fps"
  , render: _opt "render"
  , callbacks: _opt "callbacks"
  , loader: _opt "loader"
  , images: _opt "images"
  , physics: physics
  , plugins: _opt "plugins"
  , scale: _opt "scale"
  , audio: _opt "audio"
  , pipeline: _opt "pipeline"
  , backgroundColor: _opt "backgroundColor"
  , antialias: _opt "antialias"
  , antialiasGL: _opt "antialiasGL"
  , desynchronized: _opt "desynchronized"
  , pixelArt: _opt "pixelArt"
  , roundPixels: _opt "roundPixels"
  , transparent: _opt "transparent"
  , clearBeforeRender: _opt "clearBeforeRender"
  , preserveDrawingBuffer: _opt "preserveDrawingBuffer"
  , premultipliedAlpha: _opt "premultipliedAlpha"
  , failIfMajorPerformanceCaveat: _opt "failIfMajorPerformanceCaveat"
  , powerPreference: _opt "powerPreference"
  , batchSize: _opt "batchSize"
  , maxLights: _opt "maxLights"
  , maxTextures: _opt "maxTextures"
  , mipmapFilter: _opt "mipmapFilter"
  , default: defaultConfig
  }

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
defaultPhysicsConfig = _opt "default"

arcade :: ArcadeWorldConfig -> Options PhysicsConfig
arcade = _opt "arcade"
