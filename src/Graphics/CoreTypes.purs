module Graphics.Phaser.CoreTypes where

import Effect (Effect)
import Graphics.Canvas (CanvasElement, Context2D)
import Graphics.Phaser.ForeignTypes (ArcadeImage, ArcadeSprite, AudioContext, BootCallback, Group, JSONCamera, Key, KeyboardPlugin, NodeEventEmitter, PackFileSection, PhaserContainer, PhaserGame, PhaserGraphic, PhaserImage, PhaserLayer, PhaserScene, PhaserSprite, PhaserText, PluginObjectItem, StaticGroup, WebGLPipeline)
import Graphics.Phaser.ForeignTypes as FT
--import Data.Options (Options, opt, options)
import Prelude (Unit)
import Web.HTML.HTMLElement (HTMLElement)
import Data.Options (Options)

-- Current time in milliseconds

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
    -- , fullscreenTarget :: HTMLElement
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
    --, pipeline :: Options PipelineConfig
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

-- | Arcade / Matter Configs aren't fully implemented yet
type PhysicsConfig
  = ( default :: String
    -- , arcade :: Option ArcadeWorldConfig
    -- , matter :: Option MatterWorldConfig
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


-- data PipelineConfig
-- name :: Options PipelineConfig String
-- name = opt "name"

-- pipeline :: Options PipelineConfig WebGLPipeline
-- pipeline = opt "name"

-- type PipelineConfig
--   = ( name :: String
--     , pipeline :: WebGLPipeline
--     )

-- TODO: Fill out and move to proper file
type ArcadeWorldConfig
  = ( 
    -- gravity:: Option (x:: Number, y:: Number),
      debug:: Boolean
    )

-- TODO: Fill out and move to proper file
type MatterWorldConfig :: forall k. Row k
type MatterWorldConfig
  = ()

type SettingsConfig
  = ( key :: String
    , active :: Boolean
    , visible :: Boolean
    , pack :: PackFileSection
    , cameras :: Array JSONCamera
    -- TODO: map :: Object <string, string>
    -- TODO: mapAdd :: Object <string, string>
    --, physics :: Option PhysicsConfig
    --, loader :: Option LoaderConfig
    -- TODO:, plugins :: false | *
    )

class GameObject :: forall k. k -> Constraint
class (EventEmitter a, Transform a, Tint a) <= GameObject a

instance GameObject PhaserImage
instance GameObject PhaserContainer
instance GameObject PhaserGraphic
instance GameObject PhaserSprite
instance GameObject PhaserText
instance GameObject ArcadeImage
instance GameObject ArcadeSprite
instance GameObject PhaserLayer

-- Transform
-- https://photonstorm.github.io/phaser3-docs/Phaser.GameObjects.Components.Transform.html
class Transform :: forall k. k -> Constraint
class Transform a

instance Transform PhaserImage
instance Transform PhaserContainer
instance Transform PhaserGraphic
instance Transform PhaserSprite
instance Transform PhaserText
instance Transform ArcadeImage
instance Transform ArcadeSprite
instance Transform PhaserLayer

-- Tint
-- https://photonstorm.github.io/phaser3-docs/Phaser.GameObjects.Components.Tint.html
class Tint :: forall k. k -> Constraint
class Tint a

instance Tint PhaserImage
instance Tint PhaserContainer
instance Tint PhaserGraphic
instance Tint PhaserSprite
instance Tint PhaserText
instance Tint ArcadeImage
instance Tint ArcadeSprite
instance Tint PhaserLayer

class EventEmitter :: forall k. k -> Constraint
class EventEmitter a

class PhysicsEnabled :: forall k. k -> Constraint
class PhysicsEnabled a

instance EventEmitter NodeEventEmitter
instance EventEmitter PhaserImage
instance EventEmitter PhaserContainer
instance EventEmitter PhaserGraphic
instance EventEmitter PhaserSprite
instance EventEmitter PhaserText
instance EventEmitter ArcadeImage
instance EventEmitter ArcadeSprite
instance EventEmitter KeyboardPlugin
instance EventEmitter Key
instance EventEmitter PhaserLayer

-- | This is somewhat confusing.
-- | Some phaser objects inherit direct from Event Emitter
-- | Because of that you can do `img.on` or `img.emit`
-- | These objects are classified under `EventEmitter`. 
-- | But other objects have a property `.events` that is
-- | an instance of event emitter (`scene.events.on`, `game.events.emit`, etc.)
-- | This typeclass identifies objects that have the `.events` property.
class HasNodeEventEmitter :: forall k. k -> Constraint
class HasNodeEventEmitter a

instance HasNodeEventEmitter PhaserScene
instance HasNodeEventEmitter PhaserGame
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

instance PhysicsEnabled ArcadeImage
instance PhysicsEnabled ArcadeSprite

class ArcadeGroup :: forall k. k -> Constraint
class ArcadeGroup a

instance ArcadeGroup Group
instance ArcadeGroup StaticGroup

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

class Collidable :: forall k. k -> Constraint
class Collidable a

instance Collidable Group 
instance Collidable StaticGroup 
instance Collidable ArcadeImage 
instance Collidable ArcadeSprite 

instance Collidable (Array Group)
instance Collidable (Array StaticGroup)
instance Collidable (Array ArcadeImage)
instance Collidable (Array ArcadeSprite)
