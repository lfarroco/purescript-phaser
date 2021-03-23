module Graphics.Phaser.Image where

import Prelude
import Effect (Effect)
import Graphics.Phaser.Scene (PhaserScene)

foreign import data PhaserImage :: Type

foreign import addImage :: String-> {x::Number,y:: Number} -> PhaserScene -> Effect PhaserImage

foreign import setImageDisplaySize :: PhaserImage -> {width::Number,height:: Number} -> Effect Unit

foreign import setImageOrigin :: PhaserImage -> {x::Number,y:: Number} -> Effect Unit

foreign import setImagePosition :: {x::Number,y:: Number} -> PhaserImage -> Effect Unit


