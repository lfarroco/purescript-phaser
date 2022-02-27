module Graphics.Phaser.CoreTypes where

import Graphics.Phaser.ForeignTypes
  ( AudioContext
  , BootCallback
  , JSONCamera
  , PackFileSection
  , PhaserScene
  , PluginObjectItem
  , WebGLPipeline
  )
import Prelude (Unit)
import Effect (Effect)
import Graphics.Canvas (CanvasElement, Context2D)
import Option (Option)
import Web.HTML.HTMLElement (HTMLElement)

-- TODO: Change to Boolean | *InputConfig
type InputConfig
  = ( keyboard :: Boolean
    , mouse :: Boolean
    , touch :: Boolean
    , gamepad :: Boolean
    , activePointers :: Int
    , smoothFactor :: Number
    , windowEvents :: Boolean
    )

type BannerConfig
  = ( hidePhaser :: Boolean
    , text :: String
    , background :: Array String
    )

type ScaleConfig
  = ( width :: Int
    , height :: Int
    , zoom :: Number
    , parent :: HTMLElement
    , expandParent :: Boolean
    , mode :: Int -- TODO: enum ScaleModeType
    , min :: Int
    , max :: Int
    , autoRound :: Boolean
    , autoCenter :: Int -- TODO: enum CenterType
    , resizeInterval :: Int -- | ms
    , fullscreenTarget :: HTMLElement
    )

-- TODO: some strings should be wrapped as enums
type DOMContainerConfig
  = ( createContainer :: Boolean
    , behindCanvas :: Boolean
    , pointerEvents :: String
    )

type FPSConfig
  = ( min :: Int
    , target :: Int
    , forceSetTimeOut :: Boolean
    , deltaHistory :: Int
    , panicMax :: Int
    , smoothStep :: Boolean
    )

type RenderConfig
  = ( antialias :: Boolean
    , antialiasGL :: Boolean
    , desynchronized :: Boolean
    , pixelArt :: Boolean
    , roundPixels :: Boolean
    , transparent :: Boolean
    , clearBeforeRender :: Boolean
    , preserveDrawingBuffer :: Boolean
    , premultipliedAlpha :: Boolean
    , failIfMajorPerformanceCaveat :: Boolean
    , powerPreference :: String
    , batchSize :: Int
    , maxLights :: Int
    , maxTextures :: Int
    , mipmapFilter :: String
    , pipeline :: Option PipelineConfig
    )

type CallbacksConfig
  = ( preBoot :: BootCallback
    , postBoot :: BootCallback
    )

-- TODO: some strings should be wrapped as enums
type LoaderConfig
  = ( baseURL :: String
    , path :: String
    , maxParallelDownloads :: Int
    , crossOrigin :: String
    , responseType :: String
    , async :: Boolean
    , user :: String
    , password :: String
    , timeout :: Int -- | ms
    )

-- | These are paths to base64 textures
type ImagesConfig
  = ( default :: String
    , missing :: String
    , white :: String
    )

-- | Arcade / Matter Configs aren't implemented yet
type PhysicsConfig
  = ( default :: String
    , arcade :: Option ArcadeWorldConfig
    , matter :: Option MatterWorldConfig
    )

type PluginObject
  = ( global :: Array PluginObjectItem
    , scene :: Array PluginObjectItem
    , default :: Array String
    , defaultMerge :: Array String
    )

type AudioConfig
  = ( disableWebAudio :: Boolean
    , context :: AudioContext
    , noAudio :: Boolean
    )

type PipelineConfig
  = ( name :: String
    , pipeline :: WebGLPipeline
    )

-- TODO: Fill out and move to proper file
type ArcadeWorldConfig
  = ( fps :: Int
    )

-- TODO: Fill out and move to proper file
type MatterWorldConfig
  = ( fps :: Int
    )

type SettingsConfig
  = ( key :: String
    , active :: Boolean
    , visible :: Boolean
    , pack :: PackFileSection
    , cameras :: Array JSONCamera
    -- TODO: map :: Object <string, string>
    -- TODO: mapAdd :: Object <string, string>
    , phyics :: Option PhysicsConfig
    , loader :: Option LoaderConfig
    -- TODO:, plugins :: false | *
    )

type CreateSceneFromObjectConfig
  = ( init :: PhaserScene -> Effect Unit
    , preload :: PhaserScene -> Effect Unit
    , create :: PhaserScene -> Effect Unit
    , update :: PhaserScene -> Effect Unit
    )

-- TODO: some strings should be wrapped as enums
-- | Docs: https://newdocs.phaser.io/docs/3.55.2/Phaser.Types.Core#GameConfig
-- | A Phaser.Core.Config instance will be derived by flattening this into
-- | one object.
type GameConfig
  = ( width :: Number
    , height :: Number
    , zoom :: Number
    , type :: Int
    , parent :: String
    , canvas :: CanvasElement
    , canvasStyle :: String
    , customEnvironment :: Boolean
    , context :: Context2D
    -- Maybe replace with enum including `Phaser.Types.Scenes.SettingsConfig`
    , scene :: Option CreateSceneFromObjectConfig
    , seed :: Array String
    , title :: String
    , url :: String
    , version :: String
    , autoFocus :: Boolean
    , input :: Option InputConfig
    , disableContextMenu :: Boolean
    , banner :: Option BannerConfig
    , dom :: Option DOMContainerConfig
    , fps :: Option FPSConfig
    , render :: Option RenderConfig
    , callbacks :: Option CallbacksConfig
    , loader :: Option LoaderConfig
    , images :: Option ImagesConfig
    , physics :: Option PhysicsConfig
    , plugins :: Option PluginObject
    , scale :: Option ScaleConfig
    , audio :: Option AudioConfig
    , pipeline :: Option PipelineConfig
    , backgroundColor :: Int
    , antialias :: Boolean
    , antialiasGL :: Boolean
    , desynchronized :: Boolean
    , pixelArt :: Boolean
    , roundPixels :: Boolean
    , transparent :: Boolean
    , clearBeforeRender :: Boolean
    , preserveDrawingBuffer :: Boolean
    , premultipliedAlpha :: Boolean
    , failIfMajorPerformanceCaveat :: Boolean
    , powerPreference :: String
    , batchSize :: Number
    , maxLights :: Number
    , maxTextures :: Number
    , mipmapFilter :: String
    )
