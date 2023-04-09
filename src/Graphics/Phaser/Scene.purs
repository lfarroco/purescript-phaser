module Graphics.Phaser.SceneGen
  ( class Scene
  , SceneInstance
  , newScene
  -- , add
  -- , anims
  -- , cache
  -- , cameras
  -- , children
  -- , data_
  , events
  -- , facebook
  -- , game
  -- , input
  -- , lights
  -- , load
  -- , make
  -- , matter
  -- , physics
  -- , plugins
  -- , registry
  -- , renderer
  -- , scale
  -- , scene
  -- , sound
  -- , sys
  -- , textures
  -- , time
  -- , tweens
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Graphics.Phaser.Events.EventEmitter (EventEmitterInstance)

foreign import data SceneInstance :: Type

class Scene :: forall k. k -> Constraint
class Scene a

instance Scene SceneInstance

foreign import newSceneImpl :: EffectFn1 String SceneInstance

newScene :: String -> Effect SceneInstance
newScene = runEffectFn1 newSceneImpl

-- foreign import addImpl :: forall a. EffectFn1 a GameObjectFactoryInstance

-- add :: forall a. Scene a => a -> Effect GameObjectFactoryInstance
-- add = runEffectFn1 addImpl

-- foreign import animsImpl :: forall a. EffectFn1 a AnimationManagerInstance

-- anims :: forall a. Scene a => a -> Effect AnimationManagerInstance
-- anims = runEffectFn1 animsImpl

-- foreign import cacheImpl :: forall a. EffectFn1 a CacheManagerInstance

-- cache :: forall a. Scene a => a -> Effect CacheManagerInstance
-- cache = runEffectFn1 cacheImpl

-- foreign import camerasImpl :: forall a. EffectFn1 a CameraManagerInstance

-- cameras :: forall a. Scene a => a -> Effect CameraManagerInstance
-- cameras = runEffectFn1 camerasImpl

-- foreign import childrenImpl :: forall a. EffectFn1 a DisplayListInstance

-- children :: forall a. Scene a => a -> Effect DisplayListInstance
-- children = runEffectFn1 childrenImpl

-- foreign import dataImpl :: forall a. EffectFn1 a DataManagerInstance

-- data_ :: forall a. Scene a => a -> Effect DataManagerInstance
-- data_ = runEffectFn1 dataImpl

foreign import eventsImpl :: forall a. EffectFn1 a EventEmitterInstance

events :: forall a. Scene a => a -> Effect EventEmitterInstance
events = runEffectFn1 eventsImpl

-- foreign import facebookImpl :: forall a. EffectFn1 a FacebookInstantGamesPluginInstance

-- facebook :: forall a. Scene a => a -> Effect FacebookInstantGamesPluginInstance
-- facebook = runEffectFn1 facebookImpl

-- foreign import gameImpl :: forall a. EffectFn1 a GameInstance

-- game :: forall a. Scene a => a -> Effect GameInstance
-- game = runEffectFn1 gameImpl

-- foreign import inputImpl :: forall a. EffectFn1 a InputPluginInstance

-- input :: forall a. Scene a => a -> Effect InputPluginInstance
-- input = runEffectFn1 inputImpl

-- foreign import lightsImpl :: forall a. EffectFn1 a LightsManagerInstance

-- lights :: forall a. Scene a => a -> Effect LightsManagerInstance
-- lights = runEffectFn1 lightsImpl

-- foreign import loadImpl :: forall a. EffectFn1 a LoaderPluginInstance

-- load :: forall a. Scene a => a -> Effect LoaderPluginInstance
-- load = runEffectFn1 loadImpl

-- foreign import makeImpl :: forall a. EffectFn1 a GameObjectCreatorInstance

-- make :: forall a. Scene a => a -> Effect GameObjectCreatorInstance
-- make = runEffectFn1 makeImpl

-- foreign import matterImpl :: forall a. EffectFn1 a MatterPhysicsInstance

-- matter :: forall a. Scene a => a -> Effect MatterPhysicsInstance
-- matter = runEffectFn1 matterImpl

-- foreign import physicsImpl :: forall a. EffectFn1 a ArcadePhysicsInstance

-- physics :: forall a. Scene a => a -> Effect ArcadePhysicsInstance
-- physics = runEffectFn1 physicsImpl

-- foreign import pluginsImpl :: forall a. EffectFn1 a PluginManagerInstance

-- plugins :: forall a. Scene a => a -> Effect PluginManagerInstance
-- plugins = runEffectFn1 pluginsImpl

-- foreign import registryImpl :: forall a. EffectFn1 a DataManagerInstance

-- registry :: forall a. Scene a => a -> Effect DataManagerInstance
-- registry = runEffectFn1 registryImpl

-- foreign import rendererImpl :: forall a. EffectFn1 a RendererInstance

-- renderer :: forall a. Scene a => a -> Effect RendererInstance
-- renderer = runEffectFn1 rendererImpl

-- foreign import scaleImpl :: forall a. EffectFn1 a ScaleManagerInstance

-- scale :: forall a. Scene a => a -> Effect ScaleManagerInstance
-- scale = runEffectFn1 scaleImpl

-- foreign import sceneImpl :: forall a. EffectFn1 a ScenePluginInstance

-- scene :: forall a. Scene a => a -> Effect ScenePluginInstance
-- scene = runEffectFn1 sceneImpl

-- foreign import soundImpl :: forall a. EffectFn1 a SoundManagerInstance

-- sound :: forall a. Scene a => a -> Effect SoundManagerInstance
-- sound = runEffectFn1 soundImpl

-- foreign import sysImpl :: forall a. EffectFn1 a SystemsInstance

-- sys :: forall a. Scene a => a -> Effect SystemsInstance
-- sys = runEffectFn1 sysImpl

-- foreign import texturesImpl :: forall a. EffectFn1 a TextureManagerInstance

-- textures :: forall a. Scene a => a -> Effect TextureManagerInstance
-- textures = runEffectFn1 texturesImpl

-- foreign import timeImpl :: forall a. EffectFn1 a ClockInstance

-- time :: forall a. Scene a => a -> Effect ClockInstance
-- time = runEffectFn1 timeImpl

-- foreign import tweensImpl :: forall a. EffectFn1 a TweenManagerInstance

-- tweens :: forall a. Scene a => a -> Effect TweenManagerInstance
-- tweens = runEffectFn1 tweensImpl

