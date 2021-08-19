module Graphics.Phaser (create, getSceneManager, addScene) where

import Data.Function.Uncurried (Fn3, runFn3)
import Effect (Effect)
import Graphics.Phaser.Scene (SceneConfig)
import Phaser.Graphics.ForeignTypes (PhaserGame, SceneManager)

-- | A Phaser game config object can be written in multiple different ways
-- | and there  are over 30 optional properties that can be provided.  
foreign import create ::
  { width :: Int
  , height :: Int
  } ->
  Effect PhaserGame

-- | Here are included parameters that are may be hard to implement after
-- | initialization, such as specific plugins. 
foreign import createWithPlugins ::
  { width :: Int
  , height :: Int
  , plugins ::
      { scene ::
          Array
            { key :: String
            , url :: String
            , mapping :: String
            }
      , global ::
          Array
            { key :: String
            , url :: String
            , mapping :: String
            }
      }
  }

foreign import getSceneManager :: PhaserGame -> Effect SceneManager

-- Phaser provides two ways to add scenes:
-- - adding them in the `scene` parameter when creating a game
-- - using the scene manager reference (accesible by scene or game)
--    after the game has started
-- adding them *after* the game has been created, and using the scene
-- manager that the game contains seems to be the most flexible approach
-- as this decouples the scenes from the of the game logic
foreign import addSceneImpl :: forall a. Fn3 (SceneConfig a) Boolean PhaserGame (Effect PhaserGame)

-- | Raw Phaser FFI
-- | Consider using `addWithState` for a safer approach.
-- | ==== Parameters ====
-- | Sceneconfig a   - Scene configuration, bound to a initial state type
-- | Boolean         - If the scene should start in parallel right now
addScene :: forall a. SceneConfig a -> Boolean -> PhaserGame -> Effect PhaserGame
addScene = runFn3 addSceneImpl
