module Graphics.Phaser.GameObject
  ( Vector
  , Dimensions
  , OnClickCallback
  , class GameObject
  , destroy
  , getScene
  , getPosition
  , setPosition
  , getAngle
  , setAngle
  , getRadians
  , setRadians
  , getVisible
  , setVisible
  , getAlpha
  , setAlpha
  , getOrigin
  , setOrigin
  , setTint
  , clearTint
  , getSize
  , setSize
  , getDisplaySize
  , setDisplaySize
  , getScale
  , setScale
  , setName
  , getName
  ) where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)
import Graphics.Phaser.ForeignTypes (Event, PhaserContainer, PhaserEllipse, PhaserGraphic, PhaserImage, PhaserRectangle, PhaserScene, PhaserSprite, PhaserText, PhysicsImage)

type Vector
  = { x :: Number, y :: Number }

type Dimensions
  = { width :: Number, height :: Number }

-- deprecated
type OnClickCallback a
  = Vector -> Vector -> Event -> a -> Effect Unit

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
  getScene :: a -> PhaserScene

foreign import destroyImpl :: forall a. EffectFn1 a Unit

foreign import getPositionImpl :: forall a. EffectFn1 a Vector

foreign import setPositionImpl :: forall a. EffectFn2 Vector a a

foreign import getAngleImpl :: forall a. EffectFn1 a Number

foreign import setAngleImpl :: forall a. EffectFn2 Number a a

foreign import getRadiansImpl :: forall a. EffectFn1 a Number

foreign import setRadiansImpl :: forall a. EffectFn2 Number a a

foreign import getVisibleImpl :: forall a. EffectFn1 a Boolean

foreign import setVisibleImpl :: forall a. EffectFn2 Boolean a a

foreign import getAlphaImpl :: forall a. EffectFn1 a Number

foreign import setAlphaImpl :: forall a. EffectFn2 Number a a

foreign import getOriginImpl :: forall a. EffectFn1 a Vector

foreign import setOriginImpl :: forall a. EffectFn2 Vector a a

foreign import setTintImpl :: forall a. EffectFn2 String a a

foreign import clearTintImpl :: forall a. EffectFn1 a a

foreign import getSizeImpl :: forall a. EffectFn1 a Dimensions

foreign import setSizeImpl :: forall a. EffectFn2 Dimensions a a

foreign import getDisplaySizeImpl :: forall a. EffectFn1 a Dimensions

foreign import setDisplaySizeImpl :: forall a. EffectFn2 Dimensions a a

foreign import getScaleImpl :: forall a. EffectFn1 a Vector

foreign import setScaleImpl :: forall a. EffectFn2 Vector a a

foreign import getNameImpl :: forall a. EffectFn1 a String

foreign import setNameImpl :: forall a. EffectFn2 String a a

foreign import getSceneImpl :: forall a. a -> PhaserScene

instance containerInstance :: GameObject PhaserContainer where
  destroy = runEffectFn1 destroyImpl
  getPosition = runEffectFn1 getPositionImpl
  setPosition = runEffectFn2 setPositionImpl
  getAngle = runEffectFn1 getAngleImpl
  setAngle = runEffectFn2 setAngleImpl
  getRadians = runEffectFn1 getRadiansImpl
  setRadians = runEffectFn2 setRadiansImpl
  getVisible = runEffectFn1 getVisibleImpl
  setVisible = runEffectFn2 setVisibleImpl
  getAlpha = runEffectFn1 getAlphaImpl
  setAlpha = runEffectFn2 setAlphaImpl
  getOrigin = runEffectFn1 getOriginImpl
  setOrigin = runEffectFn2 setOriginImpl
  clearTint = runEffectFn1 clearTintImpl
  setTint = runEffectFn2 setTintImpl
  getSize = runEffectFn1 getSizeImpl
  setSize = runEffectFn2 setSizeImpl
  getDisplaySize = runEffectFn1 getDisplaySizeImpl
  setDisplaySize = runEffectFn2 setDisplaySizeImpl
  getScale = runEffectFn1 getScaleImpl
  setScale = runEffectFn2 setScaleImpl
  getName = runEffectFn1 getNameImpl
  setName = runEffectFn2 setNameImpl
  getScene = getSceneImpl

instance imageInstance :: GameObject PhaserImage where
  destroy = runEffectFn1 destroyImpl
  getPosition = runEffectFn1 getPositionImpl
  setPosition = runEffectFn2 setPositionImpl
  getAngle = runEffectFn1 getAngleImpl
  setAngle = runEffectFn2 setAngleImpl
  getRadians = runEffectFn1 getRadiansImpl
  setRadians = runEffectFn2 setRadiansImpl
  getVisible = runEffectFn1 getVisibleImpl
  setVisible = runEffectFn2 setVisibleImpl
  getAlpha = runEffectFn1 getAlphaImpl
  setAlpha = runEffectFn2 setAlphaImpl
  getOrigin = runEffectFn1 getOriginImpl
  setOrigin = runEffectFn2 setOriginImpl
  clearTint = runEffectFn1 clearTintImpl
  setTint = runEffectFn2 setTintImpl
  getSize = runEffectFn1 getSizeImpl
  setSize = runEffectFn2 setSizeImpl
  getDisplaySize = runEffectFn1 getDisplaySizeImpl
  setDisplaySize = runEffectFn2 setDisplaySizeImpl
  getScale = runEffectFn1 getScaleImpl
  setScale = runEffectFn2 setScaleImpl
  getName = runEffectFn1 getNameImpl
  setName = runEffectFn2 setNameImpl
  getScene = getSceneImpl

-- TODO: create a typeclass for physics bodies, that accepts PhysicsImage and others
instance physicsImageInstance :: GameObject PhysicsImage where
  destroy = runEffectFn1 destroyImpl
  getPosition = runEffectFn1 getPositionImpl
  setPosition = runEffectFn2 setPositionImpl
  getAngle = runEffectFn1 getAngleImpl
  setAngle = runEffectFn2 setAngleImpl
  getRadians = runEffectFn1 getRadiansImpl
  setRadians = runEffectFn2 setRadiansImpl
  getVisible = runEffectFn1 getVisibleImpl
  setVisible = runEffectFn2 setVisibleImpl
  getAlpha = runEffectFn1 getAlphaImpl
  setAlpha = runEffectFn2 setAlphaImpl
  getOrigin = runEffectFn1 getOriginImpl
  setOrigin = runEffectFn2 setOriginImpl
  clearTint = runEffectFn1 clearTintImpl
  setTint = runEffectFn2 setTintImpl
  getSize = runEffectFn1 getSizeImpl
  setSize = runEffectFn2 setSizeImpl
  getDisplaySize = runEffectFn1 getDisplaySizeImpl
  setDisplaySize = runEffectFn2 setDisplaySizeImpl
  getScale = runEffectFn1 getScaleImpl
  setScale = runEffectFn2 setScaleImpl
  getName = runEffectFn1 getNameImpl
  setName = runEffectFn2 setNameImpl
  getScene = getSceneImpl


instance textInstance :: GameObject PhaserText where
  destroy = runEffectFn1 destroyImpl
  getPosition = runEffectFn1 getPositionImpl
  setPosition = runEffectFn2 setPositionImpl
  getAngle = runEffectFn1 getAngleImpl
  setAngle = runEffectFn2 setAngleImpl
  getRadians = runEffectFn1 getRadiansImpl
  setRadians = runEffectFn2 setRadiansImpl
  getVisible = runEffectFn1 getVisibleImpl
  setVisible = runEffectFn2 setVisibleImpl
  getAlpha = runEffectFn1 getAlphaImpl
  setAlpha = runEffectFn2 setAlphaImpl
  getOrigin = runEffectFn1 getOriginImpl
  setOrigin = runEffectFn2 setOriginImpl
  clearTint = runEffectFn1 clearTintImpl
  setTint = runEffectFn2 setTintImpl
  getSize = runEffectFn1 getSizeImpl
  setSize = runEffectFn2 setSizeImpl
  getDisplaySize = runEffectFn1 getDisplaySizeImpl
  setDisplaySize = runEffectFn2 setDisplaySizeImpl
  getScale = runEffectFn1 getScaleImpl
  setScale = runEffectFn2 setScaleImpl
  getName = runEffectFn1 getNameImpl
  setName = runEffectFn2 setNameImpl
  getScene = getSceneImpl

instance spriteInstance :: GameObject PhaserSprite where
  destroy = runEffectFn1 destroyImpl
  getPosition = runEffectFn1 getPositionImpl
  setPosition = runEffectFn2 setPositionImpl
  getAngle = runEffectFn1 getAngleImpl
  setAngle = runEffectFn2 setAngleImpl
  getRadians = runEffectFn1 getRadiansImpl
  setRadians = runEffectFn2 setRadiansImpl
  getVisible = runEffectFn1 getVisibleImpl
  setVisible = runEffectFn2 setVisibleImpl
  getAlpha = runEffectFn1 getAlphaImpl
  setAlpha = runEffectFn2 setAlphaImpl
  getOrigin = runEffectFn1 getOriginImpl
  setOrigin = runEffectFn2 setOriginImpl
  clearTint = runEffectFn1 clearTintImpl
  setTint = runEffectFn2 setTintImpl
  getSize = runEffectFn1 getSizeImpl
  setSize = runEffectFn2 setSizeImpl
  getDisplaySize = runEffectFn1 getDisplaySizeImpl
  setDisplaySize = runEffectFn2 setDisplaySizeImpl
  getScale = runEffectFn1 getScaleImpl
  setScale = runEffectFn2 setScaleImpl
  getName = runEffectFn1 getNameImpl
  setName = runEffectFn2 setNameImpl
  getScene = getSceneImpl

instance rectInstance :: GameObject PhaserRectangle where
  destroy = runEffectFn1 destroyImpl
  getPosition = runEffectFn1 getPositionImpl
  setPosition = runEffectFn2 setPositionImpl
  getAngle = runEffectFn1 getAngleImpl
  setAngle = runEffectFn2 setAngleImpl
  getRadians = runEffectFn1 getRadiansImpl
  setRadians = runEffectFn2 setRadiansImpl
  getVisible = runEffectFn1 getVisibleImpl
  setVisible = runEffectFn2 setVisibleImpl
  getAlpha = runEffectFn1 getAlphaImpl
  setAlpha = runEffectFn2 setAlphaImpl
  getOrigin = runEffectFn1 getOriginImpl
  setOrigin = runEffectFn2 setOriginImpl
  clearTint = runEffectFn1 clearTintImpl
  setTint = runEffectFn2 setTintImpl
  getSize = runEffectFn1 getSizeImpl
  setSize = runEffectFn2 setSizeImpl
  getDisplaySize = runEffectFn1 getDisplaySizeImpl
  setDisplaySize = runEffectFn2 setDisplaySizeImpl
  getScale = runEffectFn1 getScaleImpl
  setScale = runEffectFn2 setScaleImpl
  getName = runEffectFn1 getNameImpl
  setName = runEffectFn2 setNameImpl
  getScene = getSceneImpl

instance ellipseInstance :: GameObject PhaserEllipse where
  destroy = runEffectFn1 destroyImpl
  getPosition = runEffectFn1 getPositionImpl
  setPosition = runEffectFn2 setPositionImpl
  getAngle = runEffectFn1 getAngleImpl
  setAngle = runEffectFn2 setAngleImpl
  getRadians = runEffectFn1 getRadiansImpl
  setRadians = runEffectFn2 setRadiansImpl
  getVisible = runEffectFn1 getVisibleImpl
  setVisible = runEffectFn2 setVisibleImpl
  getAlpha = runEffectFn1 getAlphaImpl
  setAlpha = runEffectFn2 setAlphaImpl
  getOrigin = runEffectFn1 getOriginImpl
  setOrigin = runEffectFn2 setOriginImpl
  clearTint = runEffectFn1 clearTintImpl
  setTint = runEffectFn2 setTintImpl
  getSize = runEffectFn1 getSizeImpl
  setSize = runEffectFn2 setSizeImpl
  getDisplaySize = runEffectFn1 getDisplaySizeImpl
  setDisplaySize = runEffectFn2 setDisplaySizeImpl
  getScale = runEffectFn1 getScaleImpl
  setScale = runEffectFn2 setScaleImpl
  getName = runEffectFn1 getNameImpl
  setName = runEffectFn2 setNameImpl
  getScene = getSceneImpl
