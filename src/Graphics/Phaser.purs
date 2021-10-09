module Graphics.Phaser
  ( create
  , createWithConfig
  , setGameDimensions
  , addScene
  , defaultGameConfig
  ) where

import Prelude
import Effect (Effect)
import Effect.Aff.Compat (EffectFn1, runEffectFn1)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Graphics.Phaser.ForeignTypes (PhaserGame)
import Graphics.Phaser.GameObject (Dimensions)
import Graphics.Phaser.Scene as Scene

type GameConfig
  = { type :: Int
    , width :: Number
    , height :: Number
    , scale ::
        { mode :: Int
        , autoCenter :: Int
        }
    , autoRound :: Boolean
    , seed :: Array String
    , title :: String
    , url :: String
    , version :: String
    , backgroundColor :: Int
    , render ::
        { antialias :: Boolean
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
        }
    , physics ::
        { default :: Boolean
        }
    , dom ::
        { createContainer :: Boolean
        , behindCanvas :: Boolean
        }
    , fps ::
        { min :: Int
        , target :: Int
        , forceSetTimeOut :: Boolean
        , deltaHistory :: Int
        }
    , disableContextMenu :: Boolean
    }

defaultGameConfig :: GameConfig
defaultGameConfig =
  { type: 0
  , width: 800.0
  , height: 600.0
  , scale:
      { mode: 0
      , autoCenter: 0
      }
  , autoRound: false
  , seed: []
  , title: ""
  , url: ""
  , version: ""
  , disableContextMenu: false
  , backgroundColor: 0
  , render:
      { antialias: true
      , antialiasGL: true
      , desynchronized: false
      , pixelArt: false
      , roundPixels: false
      , transparent: false
      , clearBeforeRender: true
      , preserveDrawingBuffer: false
      , premultipliedAlpha: true
      , failIfMajorPerformanceCaveat: false
      , powerPreference: "default"
      , batchSize: 4096
      , maxLights: 10
      , maxTextures: -1
      , mipmapFilter: "LINEAR"
      }
  , physics:
      { default: false
      }
  , dom:
      { createContainer: false
      , behindCanvas: false
      }
  , fps:
      { min: 10
      , target: 60
      , forceSetTimeOut: false
      , deltaHistory: 10
      }
  }

foreign import create :: Effect PhaserGame

foreign import createWithConfigImpl :: EffectFn1 GameConfig PhaserGame

createWithConfig :: GameConfig -> Effect PhaserGame
createWithConfig = runEffectFn1 createWithConfigImpl

foreign import setGameDimensionsImpl :: EffectFn2 Dimensions PhaserGame PhaserGame

setGameDimensions :: Dimensions -> PhaserGame -> Effect PhaserGame
setGameDimensions = runEffectFn2 setGameDimensionsImpl

foreign import addSceneImpl :: EffectFn3 Scene.SceneConfig Boolean PhaserGame PhaserGame

addScene :: Scene.SceneConfig -> Boolean -> PhaserGame -> Effect PhaserGame
addScene = runEffectFn3 addSceneImpl
