module Graphics.Phaser.GameObject
  ( Vector
  , Dimensions
  , OnClickCallback
  , class GameObject
  , destroy
  , onClick
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
import Graphics.Phaser.ForeignTypes
  ( Event
  , PhaserContainer
  , PhaserEllipse
  , PhaserGraphic
  , PhaserImage
  , PhaserRectangle
  , PhaserScene
  , PhaserSprite
  , PhaserText
  )

type Vector
  = { x :: Number, y :: Number }

type Dimensions
  = { width :: Number, height :: Number }

type OnClickCallback a
  = Vector -> Vector -> Event -> a -> Effect Unit

-- TODO: missing functions - flipx/y, depth, scrollfactor, bounds, settintfill, multi tint, blend mode
class GameObject a where
  destroy :: a -> Effect Unit
  onClick :: OnClickCallback a -> a -> Effect a
  getScene :: a -> Effect PhaserScene
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

foreign import onClickImpl :: forall a. EffectFn2 (OnClickCallback a) a a

foreign import getSceneImpl :: forall a. EffectFn1 a PhaserScene

instance containerInstance :: GameObject PhaserContainer where
  destroy i = runEffectFn1 destroyImpl i
  getPosition i = runEffectFn1 getPositionImpl i
  setPosition i = runEffectFn2 setPositionImpl i
  getAngle i = runEffectFn1 getAngleImpl i
  setAngle i = runEffectFn2 setAngleImpl i
  getRadians i = runEffectFn1 getRadiansImpl i
  setRadians i = runEffectFn2 setRadiansImpl i
  getVisible i = runEffectFn1 getVisibleImpl i
  setVisible i = runEffectFn2 setVisibleImpl i
  getAlpha i = runEffectFn1 getAlphaImpl i
  setAlpha i = runEffectFn2 setAlphaImpl i
  getOrigin i = runEffectFn1 getOriginImpl i
  setOrigin i = runEffectFn2 setOriginImpl i
  clearTint i = runEffectFn1 clearTintImpl i
  setTint i = runEffectFn2 setTintImpl i
  getSize i = runEffectFn1 getSizeImpl i
  setSize i = runEffectFn2 setSizeImpl i
  getDisplaySize i = runEffectFn1 getDisplaySizeImpl i
  setDisplaySize i = runEffectFn2 setDisplaySizeImpl i
  getScale i = runEffectFn1 getScaleImpl i
  setScale i = runEffectFn2 setScaleImpl i
  getName i = runEffectFn1 getNameImpl i
  setName i = runEffectFn2 setNameImpl i
  onClick i = runEffectFn2 onClickImpl i
  getScene i = runEffectFn1 getSceneImpl i

instance graphicsInstance :: GameObject PhaserGraphic where
  destroy i = runEffectFn1 destroyImpl i
  getPosition i = runEffectFn1 getPositionImpl i
  setPosition i = runEffectFn2 setPositionImpl i
  getAngle i = runEffectFn1 getAngleImpl i
  setAngle i = runEffectFn2 setAngleImpl i
  getRadians i = runEffectFn1 getRadiansImpl i
  setRadians i = runEffectFn2 setRadiansImpl i
  getVisible i = runEffectFn1 getVisibleImpl i
  setVisible i = runEffectFn2 setVisibleImpl i
  getAlpha i = runEffectFn1 getAlphaImpl i
  setAlpha i = runEffectFn2 setAlphaImpl i
  getOrigin i = runEffectFn1 getOriginImpl i
  setOrigin i = runEffectFn2 setOriginImpl i
  clearTint i = runEffectFn1 clearTintImpl i
  setTint i = runEffectFn2 setTintImpl i
  getSize i = runEffectFn1 getSizeImpl i
  setSize i = runEffectFn2 setSizeImpl i
  getDisplaySize i = runEffectFn1 getDisplaySizeImpl i
  setDisplaySize i = runEffectFn2 setDisplaySizeImpl i
  getScale i = runEffectFn1 getScaleImpl i
  setScale i = runEffectFn2 setScaleImpl i
  getName i = runEffectFn1 getNameImpl i
  setName i = runEffectFn2 setNameImpl i
  onClick i = runEffectFn2 onClickImpl i
  getScene i = runEffectFn1 getSceneImpl i

instance imageInstance :: GameObject PhaserImage where
  destroy i = runEffectFn1 destroyImpl i
  getPosition i = runEffectFn1 getPositionImpl i
  setPosition i = runEffectFn2 setPositionImpl i
  getAngle i = runEffectFn1 getAngleImpl i
  setAngle i = runEffectFn2 setAngleImpl i
  getRadians i = runEffectFn1 getRadiansImpl i
  setRadians i = runEffectFn2 setRadiansImpl i
  getVisible i = runEffectFn1 getVisibleImpl i
  setVisible i = runEffectFn2 setVisibleImpl i
  getAlpha i = runEffectFn1 getAlphaImpl i
  setAlpha i = runEffectFn2 setAlphaImpl i
  getOrigin i = runEffectFn1 getOriginImpl i
  setOrigin i = runEffectFn2 setOriginImpl i
  clearTint i = runEffectFn1 clearTintImpl i
  setTint i = runEffectFn2 setTintImpl i
  getSize i = runEffectFn1 getSizeImpl i
  setSize i = runEffectFn2 setSizeImpl i
  getDisplaySize i = runEffectFn1 getDisplaySizeImpl i
  setDisplaySize i = runEffectFn2 setDisplaySizeImpl i
  getScale i = runEffectFn1 getScaleImpl i
  setScale i = runEffectFn2 setScaleImpl i
  getName i = runEffectFn1 getNameImpl i
  setName i = runEffectFn2 setNameImpl i
  onClick i = runEffectFn2 onClickImpl i
  getScene i = runEffectFn1 getSceneImpl i

instance textInstance :: GameObject PhaserText where
  destroy i = runEffectFn1 destroyImpl i
  getPosition i = runEffectFn1 getPositionImpl i
  setPosition i = runEffectFn2 setPositionImpl i
  getAngle i = runEffectFn1 getAngleImpl i
  setAngle i = runEffectFn2 setAngleImpl i
  getRadians i = runEffectFn1 getRadiansImpl i
  setRadians i = runEffectFn2 setRadiansImpl i
  getVisible i = runEffectFn1 getVisibleImpl i
  setVisible i = runEffectFn2 setVisibleImpl i
  getAlpha i = runEffectFn1 getAlphaImpl i
  setAlpha i = runEffectFn2 setAlphaImpl i
  getOrigin i = runEffectFn1 getOriginImpl i
  setOrigin i = runEffectFn2 setOriginImpl i
  clearTint i = runEffectFn1 clearTintImpl i
  setTint i = runEffectFn2 setTintImpl i
  getSize i = runEffectFn1 getSizeImpl i
  setSize i = runEffectFn2 setSizeImpl i
  getDisplaySize i = runEffectFn1 getDisplaySizeImpl i
  setDisplaySize i = runEffectFn2 setDisplaySizeImpl i
  getScale i = runEffectFn1 getScaleImpl i
  setScale i = runEffectFn2 setScaleImpl i
  getName i = runEffectFn1 getNameImpl i
  setName i = runEffectFn2 setNameImpl i
  onClick i = runEffectFn2 onClickImpl i
  getScene i = runEffectFn1 getSceneImpl i

instance spriteInstance :: GameObject PhaserSprite where
  destroy i = runEffectFn1 destroyImpl i
  getPosition i = runEffectFn1 getPositionImpl i
  setPosition i = runEffectFn2 setPositionImpl i
  getAngle i = runEffectFn1 getAngleImpl i
  setAngle i = runEffectFn2 setAngleImpl i
  getRadians i = runEffectFn1 getRadiansImpl i
  setRadians i = runEffectFn2 setRadiansImpl i
  getVisible i = runEffectFn1 getVisibleImpl i
  setVisible i = runEffectFn2 setVisibleImpl i
  getAlpha i = runEffectFn1 getAlphaImpl i
  setAlpha i = runEffectFn2 setAlphaImpl i
  getOrigin i = runEffectFn1 getOriginImpl i
  setOrigin i = runEffectFn2 setOriginImpl i
  clearTint i = runEffectFn1 clearTintImpl i
  setTint i = runEffectFn2 setTintImpl i
  getSize i = runEffectFn1 getSizeImpl i
  setSize i = runEffectFn2 setSizeImpl i
  getDisplaySize i = runEffectFn1 getDisplaySizeImpl i
  setDisplaySize i = runEffectFn2 setDisplaySizeImpl i
  getScale i = runEffectFn1 getScaleImpl i
  setScale i = runEffectFn2 setScaleImpl i
  getName i = runEffectFn1 getNameImpl i
  setName i = runEffectFn2 setNameImpl i
  onClick i = runEffectFn2 onClickImpl i
  getScene i = runEffectFn1 getSceneImpl i

instance rectInstance :: GameObject PhaserRectangle where
  destroy i = runEffectFn1 destroyImpl i
  getPosition i = runEffectFn1 getPositionImpl i
  setPosition i = runEffectFn2 setPositionImpl i
  getAngle i = runEffectFn1 getAngleImpl i
  setAngle i = runEffectFn2 setAngleImpl i
  getRadians i = runEffectFn1 getRadiansImpl i
  setRadians i = runEffectFn2 setRadiansImpl i
  getVisible i = runEffectFn1 getVisibleImpl i
  setVisible i = runEffectFn2 setVisibleImpl i
  getAlpha i = runEffectFn1 getAlphaImpl i
  setAlpha i = runEffectFn2 setAlphaImpl i
  getOrigin i = runEffectFn1 getOriginImpl i
  setOrigin i = runEffectFn2 setOriginImpl i
  clearTint i = runEffectFn1 clearTintImpl i
  setTint i = runEffectFn2 setTintImpl i
  getSize i = runEffectFn1 getSizeImpl i
  setSize i = runEffectFn2 setSizeImpl i
  getDisplaySize i = runEffectFn1 getDisplaySizeImpl i
  setDisplaySize i = runEffectFn2 setDisplaySizeImpl i
  getScale i = runEffectFn1 getScaleImpl i
  setScale i = runEffectFn2 setScaleImpl i
  getName i = runEffectFn1 getNameImpl i
  setName i = runEffectFn2 setNameImpl i
  onClick i = runEffectFn2 onClickImpl i
  getScene i = runEffectFn1 getSceneImpl i

instance ellipseInstance :: GameObject PhaserEllipse where
  destroy i = runEffectFn1 destroyImpl i
  getPosition i = runEffectFn1 getPositionImpl i
  setPosition i = runEffectFn2 setPositionImpl i
  getAngle i = runEffectFn1 getAngleImpl i
  setAngle i = runEffectFn2 setAngleImpl i
  getRadians i = runEffectFn1 getRadiansImpl i
  setRadians i = runEffectFn2 setRadiansImpl i
  getVisible i = runEffectFn1 getVisibleImpl i
  setVisible i = runEffectFn2 setVisibleImpl i
  getAlpha i = runEffectFn1 getAlphaImpl i
  setAlpha i = runEffectFn2 setAlphaImpl i
  getOrigin i = runEffectFn1 getOriginImpl i
  setOrigin i = runEffectFn2 setOriginImpl i
  clearTint i = runEffectFn1 clearTintImpl i
  setTint i = runEffectFn2 setTintImpl i
  getSize i = runEffectFn1 getSizeImpl i
  setSize i = runEffectFn2 setSizeImpl i
  getDisplaySize i = runEffectFn1 getDisplaySizeImpl i
  setDisplaySize i = runEffectFn2 setDisplaySizeImpl i
  getScale i = runEffectFn1 getScaleImpl i
  setScale i = runEffectFn2 setScaleImpl i
  getName i = runEffectFn1 getNameImpl i
  setName i = runEffectFn2 setNameImpl i
  onClick i = runEffectFn2 onClickImpl i
  getScene i = runEffectFn1 getSceneImpl i
