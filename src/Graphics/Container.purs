module Graphics.Phaser.Container where

import Prelude
import Effect (Effect)
import Graphics.Phaser.Scene (PhaserScene)

foreign import data PhaserContainer :: Type

foreign import addContainer :: { x :: Number, y :: Number } -> PhaserScene -> Effect PhaserContainer

foreign import setContainerSize :: PhaserContainer -> { width :: Number, height :: Number } -> Effect PhaserContainer

-- todo: accept GameObject type
foreign import addToContainer :: forall a. PhaserContainer -> a -> Effect Unit

foreign import removeChildren :: PhaserContainer -> Effect Unit
