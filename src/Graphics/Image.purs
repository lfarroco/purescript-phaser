module Graphics.Phaser.Image (create) where

import Prelude
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserImage, PhaserScene)
import Utils.FFI (_getProp, _return3)

create :: String -> PhaserScene -> Effect PhaserImage
create v1 = _getProp "add" >=> _return3 "image" 0 0 v1
