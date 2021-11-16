module Graphics.Phaser
  ( create
  , setGameDimensions
  , defaultGameConfig
  ) where

import Prelude
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1, EffectFn2, runEffectFn2)
import Graphics.Phaser.CoreTypes (GameConfig)
import Graphics.Phaser.ForeignTypes (PhaserGame)
import Graphics.Phaser.GameObject (Dimensions)
import Option (class FromRecord, Option, fromRecord)

-- Leaving this as it might still be useful even after converting GameConfig
-- to `Option`
-- TODO: remove redundant defaults
defaultGameConfig :: Option GameConfig
defaultGameConfig =
  fromRecord
    { width: 800.0
    , height: 600.0
    , type: 0
    , scale:
        fromRecord
          { mode: 0
          , autoCenter: 0
          , autoRound: false
          }
    , disableContextMenu: false
    , backgroundColor: 0
    , render:
        fromRecord
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
        fromRecord
          {}
    , dom:
        fromRecord
          { createContainer: false
          , behindCanvas: false
          }
    , fps:
        fromRecord
          { min: 10
          , target: 60
          , forceSetTimeOut: false
          , deltaHistory: 10
          }
    }

-- | Calls Phaser's `new Game([config])` constructor
foreign import createImpl :: EffectFn1 (Option GameConfig) PhaserGame

create ::
  forall config.
  FromRecord config () GameConfig =>
  Record config -> Effect PhaserGame
create config = runEffectFn1 createImpl (fromRecord config)

foreign import setGameDimensionsImpl :: EffectFn2 Dimensions PhaserGame PhaserGame

setGameDimensions :: Dimensions -> PhaserGame -> Effect PhaserGame
setGameDimensions = runEffectFn2 setGameDimensionsImpl
