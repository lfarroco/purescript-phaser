module Graphics.Phaser.Image (create) where

import Data.Foreign.EasyFFI as FFI
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserImage, PhaserScene)

create :: String -> PhaserScene -> Effect PhaserImage
create = FFI.unsafeForeignFunction [ "textureKey", "scene", "" ] "scene.add.image(0, 0, textureKey)"
