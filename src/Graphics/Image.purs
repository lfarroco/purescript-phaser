module Graphics.Phaser.Image (create) where

import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserImage, PhaserScene)
import Graphics.Phaser.GameObject (class GameObject)
import Utils.FFI (return1)


create :: String -> PhaserScene -> Effect PhaserImage
create = return1 "add.image(0, 0, v1)"
