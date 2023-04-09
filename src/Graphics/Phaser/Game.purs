module Game
  ( newGame
  , boot
  , destroy
  , getFrame
  , getTime
  , headlessStep
  , onBlur
  , onFocus
  , onHidden
  , onVisible
  , pause
  , resume
  , start
  , step
  -- , anims
  -- , cache
  -- , canvas
  -- , config
  -- , context
  -- , device
  -- , domContainer
  , events
  -- , facebook
  , hasFocus
  -- , input
  , isBooted
  , isPaused
  , isRunning
  -- , loop
  -- , plugins
  -- , registry
  -- , renderer
  -- , scale
  -- , scene
  -- , sound
  -- , textures
  ) where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1, EffectFn2, runEffectFn2, EffectFn3, runEffectFn3)
import Graphics.Phaser.Types (class Game, EventEmitterInstance, GameConfig, GameInstance)

foreign import newGameImpl :: EffectFn1 GameConfig GameInstance

newGame :: GameConfig -> Effect GameInstance
newGame = runEffectFn1 newGameImpl

-- foreign import animsImpl :: forall a. EffectFn1 a AnimationManager

-- anims :: forall a. Game a => a -> Effect AnimationManager
-- anims = runEffectFn1 animsImpl

-- foreign import cacheImpl :: forall a. EffectFn1 a CacheManager

-- cache :: forall a. Game a => a -> Effect CacheManager
-- cache = runEffectFn1 cacheImpl

-- foreign import canvasImpl :: forall a. EffectFn1 a HTMLCanvasElement

-- canvas :: forall a. Game a => a -> Effect HTMLCanvasElement
-- canvas = runEffectFn1 canvasImpl

-- foreign import configImpl :: forall a. EffectFn1 a GameConfig

-- config :: forall a. Game a => a -> Effect GameConfig
-- config = runEffectFn1 configImpl

-- foreign import contextImpl :: forall a. EffectFn1 a RenderingContext

-- context :: forall a. Game a => a -> Effect RenderingContext
-- context = runEffectFn1 contextImpl

-- foreign import deviceImpl :: forall a. EffectFn1 a DeviceConf

-- device :: forall a. Game a => a -> Effect DeviceConf
-- device = runEffectFn1 deviceImpl

-- foreign import domContainerImpl :: forall a. EffectFn1 a HTMLDivElement

-- domContainer :: forall a. Game a => a -> Effect HTMLDivElement
-- domContainer = runEffectFn1 domContainerImpl

foreign import eventsImpl :: forall a. EffectFn1 a EventEmitterInstance

events :: forall a. Game a => a -> Effect EventEmitterInstance
events = runEffectFn1 eventsImpl

-- foreign import facebookImpl :: forall a. EffectFn1 a FacebookInstantGamesPlugin

-- facebook :: forall a. Game a => a -> Effect FacebookInstantGamesPlugin
-- facebook = runEffectFn1 facebookImpl

foreign import hasFocusImpl :: forall a. EffectFn1 a Boolean

hasFocus :: forall a. Game a => a -> Effect Boolean
hasFocus = runEffectFn1 hasFocusImpl

-- foreign import inputImpl :: forall a. EffectFn1 a InputManager

-- input :: forall a. Game a => a -> Effect InputManager
-- input = runEffectFn1 inputImpl

foreign import isBootedImpl :: forall a. EffectFn1 a Boolean

isBooted :: forall a. Game a => a -> Effect Boolean
isBooted = runEffectFn1 isBootedImpl

foreign import isPausedImpl :: forall a. EffectFn1 a Boolean

isPaused :: forall a. Game a => a -> Effect Boolean
isPaused = runEffectFn1 isPausedImpl

foreign import isRunningImpl :: forall a. EffectFn1 a Boolean

isRunning :: forall a. Game a => a -> Effect Boolean
isRunning = runEffectFn1 isRunningImpl

-- foreign import loopImpl :: forall a. EffectFn1 a TimeStep

-- loop :: forall a. Game a => a -> Effect TimeStep
-- loop = runEffectFn1 loopImpl

-- foreign import pluginsImpl :: forall a. EffectFn1 a PluginManager

-- plugins :: forall a. Game a => a -> Effect PluginManager
-- plugins = runEffectFn1 pluginsImpl

-- foreign import registryImpl :: forall a. EffectFn1 a DataManager

-- registry :: forall a. Game a => a -> Effect DataManager
-- registry = runEffectFn1 registryImpl

-- foreign import rendererImpl :: forall a. EffectFn1 a Renderer

-- renderer :: forall a. Game a => a -> Effect Renderer
-- renderer = runEffectFn1 rendererImpl

-- foreign import scaleImpl :: forall a. EffectFn1 a ScaleManager

-- scale :: forall a. Game a => a -> Effect ScaleManager
-- scale = runEffectFn1 scaleImpl

-- foreign import sceneImpl :: forall a. EffectFn1 a SceneManager

-- scene :: forall a. Game a => a -> Effect SceneManager
-- scene = runEffectFn1 sceneImpl

-- foreign import soundImpl :: forall a. EffectFn1 a SoundManager

-- sound :: forall a. Game a => a -> Effect SoundManager
-- sound = runEffectFn1 soundImpl

-- foreign import texturesImpl :: forall a. EffectFn1 a TextureManager

-- textures :: forall a. Game a => a -> Effect TextureManager
-- textures = runEffectFn1 texturesImpl

foreign import bootImpl :: forall game. EffectFn1 game Unit

boot :: forall game. Game game => game -> Effect Unit
boot = runEffectFn1 bootImpl

foreign import destroyImpl :: forall game. EffectFn2 Boolean game Unit

destroy :: forall game. Game game => Boolean -> game -> Effect Unit
destroy = runEffectFn2 destroyImpl

foreign import getFrameImpl :: forall game. EffectFn1 game Number

getFrame :: forall game. Game game => game -> Effect Number
getFrame = runEffectFn1 getFrameImpl

foreign import getTimeImpl :: forall game. EffectFn1 game Number

getTime :: forall game. Game game => game -> Effect Number
getTime = runEffectFn1 getTimeImpl

foreign import headlessStepImpl :: forall game. EffectFn3 Number Number game Unit

headlessStep :: forall game. Game game => Number -> Number -> game -> Effect Unit
headlessStep = runEffectFn3 headlessStepImpl

foreign import onBlurImpl :: forall game. EffectFn1 game Unit

onBlur :: forall game. Game game => game -> Effect Unit
onBlur = runEffectFn1 onBlurImpl

foreign import onFocusImpl :: forall game. EffectFn1 game Unit

onFocus :: forall game. Game game => game -> Effect Unit
onFocus = runEffectFn1 onFocusImpl

foreign import onHiddenImpl :: forall game. EffectFn1 game Unit

onHidden :: forall game. Game game => game -> Effect Unit
onHidden = runEffectFn1 onHiddenImpl

foreign import onVisibleImpl :: forall game. EffectFn1 game Unit

onVisible :: forall game. Game game => game -> Effect Unit
onVisible = runEffectFn1 onVisibleImpl

foreign import pauseImpl :: forall game. EffectFn1 game Unit

pause :: forall game. Game game => game -> Effect Unit
pause = runEffectFn1 pauseImpl

foreign import resumeImpl :: forall game. EffectFn1 game Unit

resume :: forall game. Game game => game -> Effect Unit
resume = runEffectFn1 resumeImpl

foreign import startImpl :: forall game. EffectFn1 game Unit

start :: forall game. Game game => game -> Effect Unit
start = runEffectFn1 startImpl

foreign import stepImpl :: forall game. EffectFn3 Number Number game Unit

step :: forall game. Game game => Number -> Number -> game -> Effect Unit
step = runEffectFn3 stepImpl

