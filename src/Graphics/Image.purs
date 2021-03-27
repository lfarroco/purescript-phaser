module Graphics.Phaser.Image where

import Prelude
import Effect (Effect)
import Graphics.Phaser.Scene (PhaserScene)

foreign import data PhaserImage :: Type

foreign import addImage :: String-> {x::Number,y:: Number} -> PhaserScene -> Effect PhaserImage
