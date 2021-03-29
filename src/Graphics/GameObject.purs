module Graphics.Phaser.GameObject where

import Prelude

import Data.Function.Uncurried (Fn2, runFn2)
import Effect (Effect)
import Phaser.Graphics.ForeignTypes (Event, PhaserContainer, PhaserGraphic, PhaserImage, PhaserScene, PhaserText)

type Vector
  = { x :: Number, y :: Number }

type Dimensions
  = { width :: Number, height :: Number }

type OnClickCallback
  = Vector -> Vector -> Event -> PhaserScene -> Effect Unit


-- TODO: missing functions - flipx/y, depth, scrollfactor, bounds, settintfill, multi tint, blend mode
class GameObject a where
  destroy :: a -> Effect Unit
  getPosition :: a -> Effect Vector
  setPosition :: Vector -> a -> Effect a
  getAngle :: a -> Effect Number
  setAngle :: Number -> a -> Effect a
  getRadians :: a -> Effect Number
  setRadians :: Number -> a -> Effect a
  getVisible :: a -> Effect Boolean
  setVisible :: Boolean -> a -> Effect a
  getAlpha :: a -> Effect Number
  setAlpha :: Number -> a -> Effect a
  getOrigin :: a -> Effect Vector
  setOrigin :: Vector -> a -> Effect a
  setTint :: String -> a -> Effect a
  clearTint :: a -> Effect a
  getSize :: a -> Effect Dimensions
  setSize :: Dimensions -> a -> Effect a
  getDisplaySize :: a -> Effect Dimensions
  setDisplaySize :: Dimensions -> a -> Effect a
  getScale :: a -> Effect Vector
  setScale :: Vector -> a -> Effect a
  setName :: String -> a -> Effect a
  getName :: a -> Effect String
  onClick :: OnClickCallback -> a -> Effect a

foreign import destroyImpl :: forall a. a -> Effect Unit

foreign import getPositionImpl :: forall a. a -> Effect Vector

foreign import setPositionImpl :: forall a. Fn2 Vector a (Effect a)

foreign import getAngleImpl :: forall a. a -> Effect Number

foreign import setAngleImpl :: forall a. Fn2 Number a (Effect a)

foreign import getRadiansImpl :: forall a. a -> Effect Number

foreign import setRadiansImpl :: forall a. Fn2 Number a (Effect a)

foreign import getVisibleImpl :: forall a. a -> Effect Boolean

foreign import setVisibleImpl :: forall a. Fn2 Boolean a (Effect a)

foreign import getAlphaImpl :: forall a. a -> Effect Number

foreign import setAlphaImpl :: forall a. Fn2 Number a (Effect a)

foreign import getOriginImpl :: forall a. a -> Effect Vector

foreign import setOriginImpl :: forall a. Fn2 Vector a (Effect a)

foreign import setTintImpl :: forall a. Fn2 String a (Effect a)

foreign import clearTintImpl :: forall a. a -> Effect a

foreign import getSizeImpl :: forall a. a -> Effect Dimensions

foreign import setSizeImpl :: forall a. Fn2 Dimensions a (Effect a)

foreign import getDisplaySizeImpl :: forall a. a -> Effect Dimensions

foreign import setDisplaySizeImpl :: forall a. Fn2 Dimensions a (Effect a)

foreign import getScaleImpl :: forall a. a -> Effect Vector

foreign import setScaleImpl :: forall a. Fn2 Vector a (Effect a)

foreign import getNameImpl :: forall a. a -> Effect String

foreign import setNameImpl :: forall a. Fn2 String a (Effect a)

foreign import onClickImpl :: forall a. Fn2 OnClickCallback a (Effect a)

instance containerInstance :: GameObject PhaserContainer where
  destroy i = destroyImpl i
  getPosition i = getPositionImpl i
  setPosition i = runFn2 setPositionImpl i
  getAngle i = getAngleImpl i
  setAngle i = runFn2 setAngleImpl i
  getRadians i = getRadiansImpl i
  setRadians i = runFn2 setRadiansImpl i
  getVisible i = getVisibleImpl i
  setVisible i = runFn2 setVisibleImpl i
  getAlpha i = getAlphaImpl i
  setAlpha i = runFn2 setAlphaImpl i
  getOrigin i = getOriginImpl i
  setOrigin i = runFn2 setOriginImpl i
  clearTint i = clearTintImpl i
  setTint i = runFn2 setTintImpl i
  getSize i = getSizeImpl i
  setSize i = runFn2 setSizeImpl i
  getDisplaySize i = getDisplaySizeImpl i
  setDisplaySize i = runFn2 setDisplaySizeImpl i
  getScale i = getScaleImpl i
  setScale i = runFn2 setScaleImpl i
  getName i = getNameImpl i
  setName i = runFn2 setNameImpl i
  onClick i = runFn2 onClickImpl i

instance graphicsInstance :: GameObject PhaserGraphic where
  destroy i = destroyImpl i
  getPosition i = getPositionImpl i
  setPosition i = runFn2 setPositionImpl i
  getAngle i = getAngleImpl i
  setAngle i = runFn2 setAngleImpl i
  getRadians i = getRadiansImpl i
  setRadians i = runFn2 setRadiansImpl i
  getVisible i = getVisibleImpl i
  setVisible i = runFn2 setVisibleImpl i
  getAlpha i = getAlphaImpl i
  setAlpha i = runFn2 setAlphaImpl i
  getOrigin i = getOriginImpl i
  setOrigin i = runFn2 setOriginImpl i
  clearTint i = clearTintImpl i
  setTint i = runFn2 setTintImpl i
  getSize i = getSizeImpl i
  setSize i = runFn2 setSizeImpl i
  getDisplaySize i = getDisplaySizeImpl i
  setDisplaySize i = runFn2 setDisplaySizeImpl i
  getScale i = getScaleImpl i
  setScale i = runFn2 setScaleImpl i
  getName i = getNameImpl i
  setName i = runFn2 setNameImpl i
  onClick i = runFn2 onClickImpl i

instance imageInstance :: GameObject PhaserImage where
  destroy i = destroyImpl i
  getPosition i = getPositionImpl i
  setPosition i = runFn2 setPositionImpl i
  getAngle i = getAngleImpl i
  setAngle i = runFn2 setAngleImpl i
  getRadians i = getRadiansImpl i
  setRadians i = runFn2 setRadiansImpl i
  getVisible i = getVisibleImpl i
  setVisible i = runFn2 setVisibleImpl i
  getAlpha i = getAlphaImpl i
  setAlpha i = runFn2 setAlphaImpl i
  getOrigin i = getOriginImpl i
  setOrigin i = runFn2 setOriginImpl i
  clearTint i = clearTintImpl i
  setTint i = runFn2 setTintImpl i
  getSize i = getSizeImpl i
  setSize i = runFn2 setSizeImpl i
  getDisplaySize i = getDisplaySizeImpl i
  setDisplaySize i = runFn2 setDisplaySizeImpl i
  getScale i = getScaleImpl i
  setScale i = runFn2 setScaleImpl i
  getName i = getNameImpl i
  setName i = runFn2 setNameImpl i
  onClick i = runFn2 onClickImpl i

instance textInstance :: GameObject PhaserText where
  destroy i = destroyImpl i
  getPosition i = getPositionImpl i
  setPosition i = runFn2 setPositionImpl i
  getAngle i = getAngleImpl i
  setAngle i = runFn2 setAngleImpl i
  getRadians i = getRadiansImpl i
  setRadians i = runFn2 setRadiansImpl i
  getVisible i = getVisibleImpl i
  setVisible i = runFn2 setVisibleImpl i
  getAlpha i = getAlphaImpl i
  setAlpha i = runFn2 setAlphaImpl i
  getOrigin i = getOriginImpl i
  setOrigin i = runFn2 setOriginImpl i
  clearTint i = clearTintImpl i
  setTint i = runFn2 setTintImpl i
  getSize i = getSizeImpl i
  setSize i = runFn2 setSizeImpl i
  getDisplaySize i = getDisplaySizeImpl i
  setDisplaySize i = runFn2 setDisplaySizeImpl i
  getScale i = getScaleImpl i
  setScale i = runFn2 setScaleImpl i
  getName i = getNameImpl i
  setName i = runFn2 setNameImpl i
  onClick i = runFn2 onClickImpl i


