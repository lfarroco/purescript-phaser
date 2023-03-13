module Graphics.Phaser.GameObject where

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (toMaybe)
import Effect (Effect)
import Graphics.Phaser.CoreTypes (class GameObject, class Tint, class Transform, Dimensions, Vector)
import Graphics.Phaser.ForeignTypes (PhaserContainer, PhaserGameObject, PhaserImage, PhaserRectangle, PhaserScene, PhaserSprite, PhaserText)
import Unsafe.Coerce (unsafeCoerce)
import Utils.FFI (_getProp, _method0, _method1, _method2, _return0, _return1, _setProp)

getScene :: forall a. GameObject a => a -> Effect PhaserScene
getScene = _getProp "scene"

destroy :: forall a. GameObject a => a -> Effect Unit
destroy = _return0 "destroy"

-- Transform Class
getX :: forall a. Transform a => a -> Effect Number
getX = _getProp "x"

getY :: forall a. Transform a => a -> Effect Number
getY = _getProp "y"

getPosition :: forall a. Transform a => a -> Effect Vector
getPosition a = do
  x <- getX a
  y <- getY a
  pure { x, y }

setPosition :: forall a. Transform a => Vector -> a -> Effect a
setPosition { x, y } = _method2 "setPosition" x y

setX :: forall a. Transform a => Number -> a -> Effect a
setX = _method1 "setX"

setY :: forall a. Transform a => Number -> a -> Effect a
setY = _method1 "setY"

getAngle :: forall a. Transform a => a -> Effect Number
getAngle = _getProp "angle"

setAngle :: forall a. Transform a => Number -> a -> Effect a
setAngle = _method1 "setAngle"

getRadians :: forall a. Transform a => a -> Effect Number
getRadians = _getProp "radians"

setRadians :: forall a. Transform a => Number -> a -> Effect a
setRadians = _method1 "setRadians"

-- The angle in radians.
getRotation :: forall a. Transform a => a -> Effect Number
getRotation = _getProp "rotation"

setRotation :: forall a. Transform a => Number -> a -> Effect a
setRotation = _method1 "setRotation"

-- Tint class
getTint ::
  forall a.
  Tint a =>
  a ->
  Effect
    { tintBottomLeft :: Number
    , tintBottomRight :: Number
    , tintTopLeft :: Number
    , tintTopRight :: Number
    }
getTint a = do
  tintTopLeft <- _getProp "tintTopLeft" a
  tintTopRight <- _getProp "tintTopRight" a
  tintBottomLeft <- _getProp "tintBottomLeft" a
  tintBottomRight <- _getProp "tintBottomRight" a
  pure
    { tintTopLeft
    , tintTopRight
    , tintBottomLeft
    , tintBottomRight
    }

clearTint :: forall a. Tint a => a -> Effect a
clearTint = _method0 "clearTint"

isTinted :: forall a. Tint a => a -> Effect Boolean
isTinted = _getProp "isTinted"

getVisible :: forall a. GameObject a => a -> Effect Boolean
getVisible = _getProp "visible"

setVisible :: forall a. GameObject a => Boolean -> a -> Effect a
setVisible = _method1 "setVisible"

getAlpha :: forall a. GameObject a => a -> Effect Number
getAlpha = _getProp "alpha"

setAlpha :: forall a. GameObject a => Number -> a -> Effect a
setAlpha = _method1 "setAlpha"

getOrigin :: forall a. GameObject a => a -> Effect Number
getOrigin = _getProp "origin"

setOrigin :: forall a. GameObject a => Vector -> a -> Effect a
setOrigin { x, y } = _method2 "setOrigin" x y

-- The color should be a string with an "octal" content
-- setTint "0xFF0000" (0x + rr + gg + bb)
setTint :: forall a. Tint a => String -> a -> Effect a
setTint = _method1 "setTint"

getSize :: forall a. GameObject a => a -> Effect Dimensions
getSize a = do
  width <- _getProp "width" a
  height <- _getProp "height" a
  pure { width, height }

setSize :: forall a. GameObject a => Dimensions -> a -> Effect a
setSize { width, height } = _method2 "setSize" width height

getWidth :: forall a. GameObject a => a -> Effect Number
getWidth = _getProp "width"

getHeight :: forall a. GameObject a => a -> Effect Number
getHeight = _getProp "height"

getDisplayWidth :: forall a. GameObject a => a -> Effect Number
getDisplayWidth = _getProp "displayWidth"

getDisplayHeight :: forall a. GameObject a => a -> Effect Number
getDisplayHeight = _getProp "displayHeight"

getDisplaySize :: forall a. GameObject a => a -> Effect Dimensions
getDisplaySize el = do 
  width <- getDisplayHeight el
  height <- getDisplayHeight el
  pure {width, height}

setDisplaySize :: forall a. GameObject a => Dimensions -> a -> Effect a
setDisplaySize { width, height } = _method2 "setDisplaySize" width height

setInteractive :: forall a. GameObject a => a -> Effect a
setInteractive = _method0 "setInteractive"

getScale :: forall a. Transform a => a -> Effect Vector
getScale a = do
  x <- _getProp "scaleX" a
  y <- _getProp "scaleY" a
  pure { x, y }

setScale :: forall a. Transform a => Vector -> a -> Effect a
setScale { x, y } = _method2 "setScale" x y

setName :: forall a. GameObject a => String -> a -> Effect a
setName = _method1 "setName"

getName :: forall a. GameObject a => a -> Effect String
getName = _getProp "name"

flipX :: forall a. GameObject a => Boolean -> a -> Effect a
flipX  = _setProp "flipX"

flipY :: forall a. GameObject a => Boolean -> a -> Effect a
flipY  = _setProp "flipY"

-- Convertions
asGameObject :: forall a. GameObject a => a -> PhaserGameObject
asGameObject = unsafeCoerce

-- TODO: check properties of object before converting, retuning an error if type doesn't match
asImage :: PhaserGameObject -> Effect PhaserImage
asImage = unsafeCoerce

asContainer :: PhaserGameObject -> Effect PhaserContainer
asContainer = unsafeCoerce

asText :: PhaserGameObject -> Effect PhaserText
asText = unsafeCoerce

asRect :: PhaserGameObject -> Effect PhaserRectangle
asRect = unsafeCoerce

asSprite :: PhaserGameObject -> Effect PhaserSprite
asSprite = unsafeCoerce

-- TODO: use the data registry as parameter
getData :: forall obj a. GameObject obj => String -> obj -> Effect (Maybe a)
getData k obj = do
  _return1 "getData" k obj >>= (toMaybe >>> pure)

setData :: forall obj a. GameObject obj => String -> a -> obj -> Effect obj
setData = _method2 "setData"


