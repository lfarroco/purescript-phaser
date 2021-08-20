module Graphics.Phaser.Loader where

import Prelude
import Data.Function.Uncurried (Fn2, Fn3, Fn4, runFn2, runFn3, runFn4)
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserScene)

foreign import setBaseUrl :: String -> PhaserScene -> Effect Unit

foreign import setPath :: String -> PhaserScene -> Effect Unit

foreign import loadImagesImpl :: Fn2 (Array { key :: String, path :: String }) PhaserScene (Effect Unit)

loadImages :: Array { key :: String, path :: String } -> PhaserScene -> Effect Unit
loadImages = runFn2 loadImagesImpl

foreign import onceLoadCompleteImpl :: Fn2 PhaserScene (PhaserScene -> Effect Unit) (Effect PhaserScene)

onceLoadComplete :: PhaserScene -> (PhaserScene -> Effect Unit) -> Effect PhaserScene
onceLoadComplete = runFn2 onceLoadCompleteImpl

foreign import loadAtlasImpl :: Fn4 String String String PhaserScene (Effect PhaserScene)

loadAtlas :: String -> String -> String -> PhaserScene -> Effect PhaserScene
loadAtlas = runFn4 loadAtlasImpl

foreign import loadPluginImpl :: Fn3 String String PhaserScene (Effect PhaserScene)

loadPlugin :: String -> String -> PhaserScene -> Effect PhaserScene
loadPlugin = runFn3 loadPluginImpl

foreign import loadScenePluginImpl :: Fn4 String String String PhaserScene (Effect PhaserScene)

loadScene :: String -> String -> String -> PhaserScene -> Effect PhaserScene
loadScene = runFn4 loadScenePluginImpl

type LoadSpritesheetConfig
  = { frameWidth :: Number, frameHeight :: Number, startFrame :: Int, endFrame :: Int, margin :: Int, spacing :: Int }

foreign import loadSpritesheetImpl :: Fn4 String String LoadSpritesheetConfig PhaserScene (Effect PhaserScene)

loadSpritesheet :: String -> String -> LoadSpritesheetConfig -> PhaserScene -> (Effect PhaserScene)
loadSpritesheet = runFn4 loadSpritesheetImpl
