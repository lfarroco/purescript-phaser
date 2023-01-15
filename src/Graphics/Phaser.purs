module Graphics.Phaser
  ( addScene
  , create
  , createWithConfig
  , createWithUnsafeConfig
  , destroy
  , setDimensions
  , config
  , physicsConfig
  ) where

import Prelude
import Data.Options (Options, options)
import Effect (Effect)
import Graphics.Phaser.CoreTypes (Dimensions)
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserScene)
import Graphics.Phaser.GameConfig (GameConfig, GameConfigIndex, PhysicsConfigIndex, _gameConfig, _physicsConfig)
import Utils.FFI (_getProp, _method4, _new0, _new1, _return0, _setProp, phaser)

create :: Effect PhaserGame
create = phaser >>= _getProp "Game" >>= _new0

destroy :: PhaserGame -> Effect Unit
destroy = _return0 "destroy"

createWithConfig :: Options GameConfig -> Effect PhaserGame
createWithConfig opts = createWithUnsafeConfig (options opts)

-- | This function allows passing anything to Phaser's config
-- | You can use it for properties that are not defined in this library
-- | https://photonstorm.github.io/phaser3-docs/Phaser.Types.Core.html#.GameConfig
createWithUnsafeConfig :: forall a. a -> Effect PhaserGame
createWithUnsafeConfig cfg = phaser >>= _getProp "Game" >>= _new1 cfg

setDimensions :: Dimensions -> PhaserGame -> Effect PhaserGame
setDimensions { width, height } game = do
  void $ _getProp "config" game 
    >>= _setProp "width" width 
    >>= _setProp "height" height 
  pure game

config :: GameConfigIndex
config = _gameConfig

physicsConfig :: PhysicsConfigIndex
physicsConfig = _physicsConfig

-- Allows adding a scene _after_ a game has started
addScene :: forall sceneData. String -> PhaserGame -> PhaserScene -> Boolean -> sceneData -> Effect PhaserGame
addScene key game scene autoStart sceneData = do
  sceneMngr <- _getProp "scene" game
  void $ _method4 "add" key scene autoStart sceneData sceneMngr
  pure game
