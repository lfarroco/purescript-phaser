module Phaser.Graphics.ArcadePhysics where

-- A port of
-- https://photonstorm.github.io/phaser3-docs/Phaser.Physics.Arcade.StaticGroup.html
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Graphics.Phaser.ForeignTypes (PhaserScene)

-- All Game Objects created by or added to this Group will automatically be given static Arcade Physics bodies, if they have no body.
foreign import data StaticGroup :: Type

foreign import createStaticGroupImpl :: EffectFn1 PhaserScene StaticGroup

createStaticGroup :: PhaserScene -> Effect StaticGroup
createStaticGroup = runEffectFn1 createStaticGroupImpl
