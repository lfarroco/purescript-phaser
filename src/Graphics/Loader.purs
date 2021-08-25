module Graphics.Phaser.Loader where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, EffectFn4, runEffectFn2, runEffectFn3, runEffectFn4)
import Phaser.Graphics.ForeignTypes (PhaserScene)

foreign import setBaseUrlImpl :: EffectFn2
    String
    PhaserScene
    Unit
    
setBaseUrl :: String -> PhaserScene -> Effect Unit
setBaseUrl = runEffectFn2 setBaseUrlImpl

foreign import setPathImpl :: EffectFn2
    String
    PhaserScene
    Unit

setPath :: String -> PhaserScene -> Effect Unit
setPath = runEffectFn2 setPathImpl

foreign import loadImagesImpl :: EffectFn2
    (Array { key :: String, path :: String })
    PhaserScene
    Unit

loadImages :: Array { key :: String, path :: String } -> PhaserScene -> Effect Unit
loadImages = runEffectFn2 loadImagesImpl

foreign import onceLoadCompleteImpl :: EffectFn2
    PhaserScene
    (PhaserScene -> Effect Unit)
    PhaserScene

onceLoadComplete
    :: PhaserScene
    -> (PhaserScene -> Effect Unit)
    -> Effect PhaserScene
onceLoadComplete = runEffectFn2 onceLoadCompleteImpl

foreign import loadAtlasImpl :: EffectFn4
    String
    String
    String
    PhaserScene
    PhaserScene

loadAtlas
    :: String
    -> String
    -> String
    -> PhaserScene
    -> Effect PhaserScene
loadAtlas = runEffectFn4 loadAtlasImpl

foreign import loadPluginImpl :: EffectFn3
    String
    String
    PhaserScene
    PhaserScene

loadPlugin :: String -> String -> PhaserScene -> Effect PhaserScene
loadPlugin = runEffectFn3 loadPluginImpl

foreign import loadScenePluginImpl :: EffectFn4
    String
    String
    String
    PhaserScene
    PhaserScene

loadScene :: String -> String -> String -> PhaserScene -> Effect PhaserScene
loadScene = runEffectFn4 loadScenePluginImpl

<<<<<<< HEAD
type LoadSpritesheetConfig
  = { frameWidth :: Number, frameHeight :: Number, startFrame :: Int, endFrame :: Int, margin :: Int, spacing :: Int }

foreign import loadSpritesheetImpl :: Fn4 String String LoadSpritesheetConfig PhaserScene (Effect PhaserScene)

loadSpritesheet :: String -> String -> LoadSpritesheetConfig -> PhaserScene -> (Effect PhaserScene)
loadSpritesheet = runFn4 loadSpritesheetImpl
=======
foreign import loadSpritesheetImpl :: EffectFn4
    String
    String
    { frameWidth :: Number
    , frameHeight :: Number
    , startFrame :: Int
    , endFrame :: Int
    , margin :: Int
    , spacing :: Int
    }
    PhaserScene
    PhaserScene
>>>>>>> b4509ff (change js functions to ES6 and use EffectFn)
