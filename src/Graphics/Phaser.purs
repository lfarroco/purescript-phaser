module Graphics.Phaser (create, setGameDimensions, getSceneManager, addScene) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Graphics.Phaser.ForeignTypes (PhaserGame, SceneManager)
import Graphics.Phaser.GameObject (Dimensions)
import Graphics.Phaser.Scene as Scene

foreign import create :: Effect PhaserGame

foreign import setGameDimensionsImpl :: EffectFn2 Dimensions PhaserGame PhaserGame

setGameDimensions :: Dimensions -> PhaserGame -> Effect PhaserGame
setGameDimensions = runEffectFn2 setGameDimensionsImpl

-- | Here are included parameters that are may be hard to implement after
-- | initialization, such as specific plugins. 
foreign import createWithPlugins ::
  { plugins ::
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
foreign import addSceneImpl :: forall a. EffectFn3 (Scene.SceneConfig a) Boolean PhaserGame PhaserGame

-- | Raw Phaser FFI
-- | ==== Parameters ====
-- | Sceneconfig a   - Scene configuration, bound to a initial state type
-- | Boolean         - If the scene should start in parallel right now
addScene :: forall a. Scene.SceneConfig a -> Boolean -> PhaserGame -> Effect PhaserGame
addScene = runEffectFn3 addSceneImpl
