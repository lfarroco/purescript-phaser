module Graphics.Phaser where

import Data.Function.Uncurried (Fn5, runFn5)
import Effect (Effect)
import Graphics.Phaser.Scene (Scene, getPhaserScene)
import Phaser.Graphics.ForeignTypes (PhaserGame, PhaserScene, SceneManager)


foreign import createGame :: { width :: Int , height :: Int } -> Effect PhaserGame

foreign import getSceneManager :: PhaserGame -> Effect SceneManager

foreign import addSceneImpl :: forall a. Fn5 String PhaserScene Boolean a PhaserGame (Effect PhaserGame) 

addScene :: forall a. String -> Scene a -> Boolean -> a-> PhaserGame -> Effect PhaserGame
addScene key scene autoStart data_ game = 
  runFn5 addSceneImpl key (getPhaserScene scene) autoStart data_ game

