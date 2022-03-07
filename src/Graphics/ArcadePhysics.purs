module Phaser.Graphics.ArcadePhysics where

-- A port of
-- https://photonstorm.github.io/phaser3-docs/Phaser.Physics.Arcade.StaticGroup.html

import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserScene)
import Graphics.Phaser.GameObject (class GameObject, Vector)
import Utils.FFI (return0, return2)

-- All Game Objects created by or added to this Group will automatically be given static Arcade Physics bodies, if they have no body.
foreign import data StaticGroup :: Type

foreign import data ArcadeImage :: Type

instance GameObject ArcadeImage

createStaticGroup :: PhaserScene -> Effect StaticGroup
createStaticGroup = return0 "physics.add.staticGroup()"

createArcadeImage :: Vector -> String ->  PhaserScene -> Effect ArcadeImage
createArcadeImage = return2 "physics.add.image(v1.x,v1.y,v2)"
