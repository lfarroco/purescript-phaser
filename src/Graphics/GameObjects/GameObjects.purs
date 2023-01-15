module Graphics.Phaser.GameObjects where

-- | https://github.com/photonstorm/phaser/blob/v3.55.0/src/gameobjects/index.js

import Prelude

import Effect (Effect)
import Utils.FFI (_getProp, phaser)

-- | An index for all Game Object types
foreign import data GameObjects :: Type

gameObjects :: Effect GameObjects
gameObjects = phaser >>= _getProp "GameObjects"
