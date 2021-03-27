module Graphics.Phaser.Container (PhaserContainer, create, addChild, removeChildren) where

import Prelude
import Data.Function.Uncurried (Fn2, runFn2)
import Effect (Effect)
import Graphics.Phaser.GameObject (class GameObject)
import Graphics.Phaser.GameObject as GO
import Graphics.Phaser.Scene (PhaserScene)

foreign import data PhaserContainer :: Type

foreign import createImpl :: Fn2 { x :: Number, y :: Number } PhaserScene (Effect PhaserContainer)

-- | Creates a new container that belongs to the given scene
create :: { x :: Number, y :: Number } -> PhaserScene -> Effect PhaserContainer
create vector scene = runFn2 createImpl vector scene

foreign import addChildImpl :: forall a. Fn2 PhaserContainer a (Effect Unit)

-- | Inserts a game object as a child of the given container
addChild :: forall a. GameObject a => a -> PhaserContainer -> Effect Unit
addChild container obj = runFn2 addChildImpl obj container

-- | Removes all children from a container
foreign import removeChildren :: PhaserContainer -> Effect Unit

-- | Implements the GameObject type class
instance containerInstance :: GameObject PhaserContainer where
  destroy i = GO.destroyImpl i
  getPosition i = GO.getPositionImpl i
  setPosition i = runFn2 GO.setPositionImpl i
  getAngle i = GO.getAngleImpl i
  setAngle i = runFn2 GO.setAngleImpl i
  getRadians i = GO.getRadiansImpl i
  setRadians i = runFn2 GO.setRadiansImpl i
  getVisible i = GO.getVisibleImpl i
  setVisible i = runFn2 GO.setVisibleImpl i
  getAlpha i = GO.getAlphaImpl i
  setAlpha i = runFn2 GO.setAlphaImpl i
  getOrigin i = GO.getOriginImpl i
  setOrigin i = runFn2 GO.setOriginImpl i
  clearTint i = GO.clearTintImpl i
  setTint i = runFn2 GO.setTintImpl i
  getSize i = GO.getSizeImpl i
  setSize i = runFn2 GO.setSizeImpl i
  getDisplaySize i = GO.getSizeImpl i
  setDisplaySize i = runFn2 GO.setSizeImpl i
  getScale i = GO.getScaleImpl i
  setScale i = runFn2 GO.setScaleImpl i
  getName i = GO.getNameImpl i
  setName i = runFn2 GO.setNameImpl i
  onClick i = runFn2 GO.onClickImpl i
