module Graphics.Phaser.CoreTypes where

import Prelude

import Graphics.Phaser.ForeignTypes as FT
import Web.HTML.HTMLElement (HTMLElement)

-- Current time in milliseconds

data PhaserNamespace

type Time
  = Number

-- Milliseconds since the last frame
type Delta
  = Number

type Vector
  = { x :: Number, y :: Number }

type Dimensions
  = { width :: Number, height :: Number }

-- TODO: Change to Boolean | *InputConfig
type InputConfig
  = {  keyboard :: Boolean
    , mouse :: Boolean
    , touch :: Boolean
    , gamepad :: Boolean
    , activePointers :: Int
    , smoothFactor :: Number
    , windowEvents :: Boolean
     }

type BannerConfig
  = {  hidePhaser :: Boolean
    , text :: String
    , background :: Array String
     }

type ScaleConfig
  = {  width :: Int
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
    -- , fullscreenTarget :: HTMLElement
     }

-- TODO: some strings should be wrapped as enums
type DOMContainerConfig
  = { createContainer :: Boolean
    , behindCanvas :: Boolean
    , pointerEvents :: String
    }

type FPSConfig
  = { min :: Int
    , target :: Int
    , forceSetTimeOut :: Boolean
    , deltaHistory :: Int
    , panicMax :: Int
    , smoothStep :: Boolean
    }

type RenderConfig
  = { antialias :: Boolean
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
    --, pipeline :: Options PipelineConfig
    }

type CallbacksConfig
  = { preBoot :: FT.BootCallback
    , postBoot :: FT.BootCallback
    }

-- TODO: some strings should be wrapped as enums
type LoaderConfig
  = { baseURL :: String
    , path :: String
    , maxParallelDownloads :: Int
    , crossOrigin :: String
    , responseType :: String
    , async :: Boolean
    , user :: String
    , password :: String
    , timeout :: Int -- | ms
    }

-- | These are paths to base64 textures
type ImagesConfig
  = { default :: String
    , missing :: String
    , white :: String
    }

-- | Arcade / Matter Configs aren't fully implemented yet
type PhysicsConfig
  = { default :: String
    , arcade :: ArcadeWorldConfig -- TODO: use Options
    -- TODO: add Matter
    -- , matter :: MatterWorldConfig 
    }

type PluginObject
  = { global :: Array FT.PluginObjectItem
    , scene :: Array FT.PluginObjectItem
    , default :: Array String
    , defaultMerge :: Array String
    }

type AudioConfig
  = { disableWebAudio :: Boolean
    , context :: FT.AudioContext
    , noAudio :: Boolean
    }


-- data PipelineConfig
-- name :: Options PipelineConfig String
-- name = opt "name"

-- pipeline :: Options PipelineConfig WebGLPipeline
-- pipeline = opt "name"

-- type PipelineConfig
--   = ( name :: String
--     , pipeline :: WebGLPipeline
--     )

type ArcadeWorldConfig
  = { 
      gravity ::  {x:: Number, y:: Number},
      debug:: Boolean
    }

type SettingsConfig
  = { key :: String
    , active :: Boolean
    , visible :: Boolean
    , pack :: FT.PackFileSection
    , cameras :: Array FT.JSONCamera
    -- TODO: map :: Object <string, string>
    -- TODO: mapAdd :: Object <string, string>
    --, physics :: Option PhysicsConfig
    --, loader :: Option LoaderConfig
    -- TODO:, plugins :: false | *
    }

class GameObject :: forall k. k -> Constraint
class (EventEmitter a, Transform a, Tint a) <= GameObject a

instance GameObject FT.PhaserGameObject
instance GameObject FT.PhaserImage
instance GameObject FT.PhaserContainer
instance GameObject FT.PhaserGraphic
instance GameObject FT.PhaserSprite
instance GameObject FT.PhaserText
instance GameObject FT.ArcadeImage
instance GameObject FT.ArcadeSprite
instance GameObject FT.PhaserLayer
instance GameObject FT.PhaserLine

-- Transform
-- https://photonstorm.github.io/phaser3-docs/Phaser.GameObjects.Components.Transform.html
class Transform :: forall k. k -> Constraint
class Transform a

instance Transform  FT.PhaserGameObject
instance Transform FT.PhaserImage
instance Transform FT.PhaserContainer
instance Transform FT.PhaserGraphic
instance Transform FT.PhaserSprite
instance Transform FT.PhaserText
instance Transform FT.ArcadeImage
instance Transform FT.ArcadeSprite
instance Transform FT.PhaserLayer
instance Transform FT.PhaserLine

-- Tint
-- https://photonstorm.github.io/phaser3-docs/Phaser.GameObjects.Components.Tint.html
class Tint :: forall k. k -> Constraint
class Tint a

instance Tint   FT.PhaserGameObject
instance Tint FT.PhaserImage
instance Tint FT.PhaserContainer
instance Tint FT.PhaserGraphic
instance Tint FT.PhaserSprite
instance Tint FT.PhaserText
instance Tint FT.ArcadeImage
instance Tint FT.ArcadeSprite
instance Tint FT.PhaserLayer
instance Tint FT.PhaserLine

class EventEmitter :: forall k. k -> Constraint
class EventEmitter a

class PhysicsEnabled :: forall k. k -> Constraint
class PhysicsEnabled a

instance EventEmitter FT.PhaserGameObject
instance EventEmitter FT.NodeEventEmitter
instance EventEmitter FT.PhaserImage
instance EventEmitter FT.PhaserContainer
instance EventEmitter FT.PhaserGraphic
instance EventEmitter FT.PhaserSprite
instance EventEmitter FT.PhaserText
instance EventEmitter FT.ArcadeImage
instance EventEmitter FT.ArcadeSprite
instance EventEmitter FT.KeyboardPlugin
instance EventEmitter FT.Key
instance EventEmitter FT.PhaserLayer
instance EventEmitter FT.PhaserInputPlugin
instance EventEmitter FT.PhaserLoaderPlugin
instance EventEmitter FT.PhaserLine

-- | This is somewhat confusing.
-- | Some phaser objects inherit direct from Event Emitter
-- | Because of that you can do `img.on` or `img.emit`
-- | These objects are classified under `EventEmitter`. 
-- | But other objects have a property `.events` that is
-- | an instance of event emitter (`scene.events.on`, `game.events.emit`, etc.)
-- | This typeclass identifies objects that have the `.events` property.
class HasNodeEventEmitter :: forall k. k -> Constraint
class HasNodeEventEmitter a

instance HasNodeEventEmitter FT.PhaserScene
instance HasNodeEventEmitter FT.PhaserGame
instance HasNodeEventEmitter FT.PhaserDisplayList 
instance HasNodeEventEmitter FT.PhaserGameObjectCreator
instance HasNodeEventEmitter FT.PhaserGameObjectFactory
instance HasNodeEventEmitter FT.PhaserLayer
instance HasNodeEventEmitter FT.PhaserGamePad
instance HasNodeEventEmitter FT.PhaserGamePadButton
instance HasNodeEventEmitter FT.PhaserSystems
instance HasNodeEventEmitter FT.PhaserCache

{-         
  According to Phaser docs, users should not interact with the scene manager directly -
  they should use the scene plugin instead:
  "* You should not usually interact directly with the Scene Manager at all. Instead, you should use
  * the Scene Plugin, which is available from every Scene in your game via the `this.scene` property."
           -}

class HasScenePlugin :: forall k. k -> Constraint
class HasScenePlugin a

instance HasScenePlugin  FT.PhaserGame
instance HasScenePlugin  FT.PhaserScene

instance PhysicsEnabled FT.ArcadeImage
instance PhysicsEnabled FT.ArcadeSprite

class ArcadeGroup :: forall k. k -> Constraint
class ArcadeGroup a

instance ArcadeGroup FT.Group
instance ArcadeGroup FT.StaticGroup

{-
  same approach as
  https://github.com/purescript-web/purescript-web-events/blob/c8a50893f04f54e2a59be7f885d25caef3589c57/src/Web/Event/EventTarget.js#L3
  When when you remove a listener, on js-side, you need to pass a reference
  to the exact same function that you provided when the listener was created.
  The createEventListenerN functions below allow converting ps functions into
  concrete event listeners that you can pass on creation and removal.
  TODO: maybe replace this with the DOM type, for more portability
-}
foreign import data EventListener :: Type

instance Show EventListener  where
  show _ = "EventListener"

class Collidable :: forall k. k -> Constraint
class Collidable a

instance Collidable FT.Group 
instance Collidable FT.StaticGroup 
instance Collidable FT.ArcadeImage 
instance Collidable FT.ArcadeSprite 
instance Collidable FT.PhaserLayer 

instance Collidable (Array FT.Group)
instance Collidable (Array FT.StaticGroup)
instance Collidable (Array FT.ArcadeImage)
instance Collidable (Array FT.ArcadeSprite)
