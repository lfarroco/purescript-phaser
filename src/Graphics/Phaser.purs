module Graphics.Phaser
  ( create
  , createWithConfig
  , createWithUnsafeConfig
  , setDimensions
  , config
  , physicsConfig
  ) where

import Prelude
import Data.Options (Options, options)
import Effect (Effect)
import Graphics.Phaser.CoreTypes (Dimensions)
import Graphics.Phaser.ForeignTypes (PhaserGame)
import Graphics.Phaser.GameConfig (GameConfig, GameConfigIndex, PhysicsConfigIndex, _gameConfig, _physicsConfig)
import Utils.FFI (_getProp, _new0, _new1, _setProp, phaser)

create :: Effect PhaserGame
create = phaser >>= _getProp "Game" >>= _new0

createWithConfig :: Options GameConfig -> Effect PhaserGame
createWithConfig opts = createWithUnsafeConfig (options opts)

-- | This function allows passing anything to Phaser's config
-- | You can use it for properties that are not defined in this library
-- | https://photonstorm.github.io/phaser3-docs/Phaser.Types.Core.html#.GameConfig
createWithUnsafeConfig :: forall a. a -> Effect PhaserGame
createWithUnsafeConfig cfg = phaser >>= _getProp "Game" >>= _new1 cfg

setDimensions :: Dimensions -> PhaserGame -> Effect PhaserGame
setDimensions { width, height } game = do
  conf <- _getProp "config" game
  _setProp "width" width conf
  _setProp "height" height conf
  pure game

config :: GameConfigIndex
config = _gameConfig

physicsConfig :: PhysicsConfigIndex
physicsConfig = _physicsConfig
