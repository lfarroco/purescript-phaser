module Graphics.Phaser.Input.Pointer
  ( active
  , angle
  )
  where

import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserPointer)
import Utils.FFI (getProperty)

-- Pointer methods
-- https://photonstorm.github.io/phaser3-docs/Phaser.Input.Pointer.html
active :: PhaserPointer -> Effect Boolean
active = getProperty "active"

angle :: PhaserPointer -> Effect Number
angle = getProperty "angle"

button :: PhaserPointer -> Effect Number
button = getProperty "button"
