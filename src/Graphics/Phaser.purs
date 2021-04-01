module Graphics.Phaser where

import Data.Function.Uncurried (Fn5, runFn5)
import Effect (Effect)
import Graphics.Phaser.Scene (SceneConfig)
import Phaser.Graphics.ForeignTypes (PhaserGame, SceneManager)

foreign import createGame :: { width :: Int, height :: Int } -> Effect PhaserGame

foreign import getSceneManager :: PhaserGame -> Effect SceneManager

foreign import addSceneImpl :: forall a. Fn5 String (SceneConfig a) Boolean a PhaserGame (Effect PhaserGame)


-- Phaser provides two ways to add scenes:
-- - adding them in the `scene` parameter when creating a game
-- - using the scene manager reference (accesible by scene or game)
--    after the game has started
-- adding them *after* the game has been created, and using the scene
-- manager that the game contains seems to be the most flexible approach
-- as this decouples the scenes from the of the game logic

addScene :: forall a. String -> SceneConfig a -> Boolean -> a -> PhaserGame -> Effect PhaserGame
addScene key sceneConfig autoStart initialState game = runFn5 addSceneImpl key sceneConfig autoStart initialState game
