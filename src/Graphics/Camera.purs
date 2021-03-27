module Graphics.Phaser.Camera where

import Data.Unit (Unit)
import Effect (Effect)
import Graphics.Phaser.Scene (PhaserScene)

foreign import setMainCameraBounds ::
  { scene :: PhaserScene
  , x :: Number
  , y :: Number
  , width :: Number
  , height :: Number
  } ->
  Effect Unit
