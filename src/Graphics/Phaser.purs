module Graphics.Phaser where

import Effect (Effect)

foreign import data PhaserGame :: Type

foreign import createGame :: { width :: Int, height :: Int } -> Effect PhaserGame
