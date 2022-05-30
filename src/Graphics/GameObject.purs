module Graphics.Phaser.GameObject where

import Prelude
import Effect (Effect)
import Graphics.Phaser.CoreTypes (class GameObject, class Tint, class Transform, Dimensions, Vector)
import Graphics.Phaser.ForeignTypes (PhaserScene)
import Utils.FFI (getProperty, method0, method1, return0)

getScene :: forall a. GameObject a => a -> Effect PhaserScene
getScene = getProperty "scene"

destroy :: forall a. GameObject a => a -> Effect Unit
destroy = return0 "destroy()"

-- Transform Class
getX :: forall a. Transform a => a -> Effect Number
getX = getProperty "x"

getY :: forall a. Transform a => a -> Effect Number
getY = getProperty "y"

getPosition :: forall a. Transform a => a -> Effect Vector
getPosition a = do
  x <- getX a
  y <- getY a
  pure { x, y }

setPosition :: forall a. Transform a => Vector -> a -> Effect a
setPosition = method1 "setPosition(v1.x,v1.y)"

setX :: forall a. Transform a => Number -> a -> Effect a
setX = method1 "setX(v1)"

setY :: forall a. Transform a => Number -> a -> Effect a
setY = method1 "setY(v1)"

getAngle :: forall a. Transform a => a -> Effect Number
getAngle = getProperty "angle"

setAngle :: forall a. Transform a => Number -> a -> Effect a
setAngle = method1 "setAngle(v1)"

getRadians :: forall a. Transform a => a -> Effect Number
getRadians = getProperty "radians"

setRadians :: forall a. Transform a => Number -> a -> Effect a
setRadians = method1 "setRadians(v1)"

-- The angle in radians.
getRotation :: forall a. Transform a => a -> Effect Number
getRotation = getProperty "rotation"

setRotation :: forall a. Transform a => Number -> a -> Effect a
setRotation = method1 "setRotation(v1)"

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
  tintTopLeft <- getProperty "tintTopLeft" a
  tintTopRight <- getProperty "tintTopRight" a
  tintBottomLeft <- getProperty "tintBottomLeft" a
  tintBottomRight <- getProperty "tintBottomRight" a
  pure
    { tintTopLeft
    , tintTopRight
    , tintBottomLeft
    , tintBottomRight
    }

clearTint :: forall a. Tint a => a -> Effect a
clearTint = method0 "clearTint()"

isTinted :: forall a. Tint a => a -> Effect Boolean
isTinted = getProperty "isTinted"

getVisible :: forall a. GameObject a => a -> Effect Boolean
getVisible = getProperty "visible"

setVisible :: forall a. GameObject a => Boolean -> a -> Effect a
setVisible = method1 "setVisible(v1)"

getAlpha :: forall a. GameObject a => a -> Effect Number
getAlpha = getProperty "alpha"

setAlpha :: forall a. GameObject a => Number -> a -> Effect a
setAlpha = method1 "setAlpha(v1)"

getOrigin :: forall a. GameObject a => a -> Effect Number
getOrigin = getProperty "origin"

setOrigin :: forall a. GameObject a => Vector -> a -> Effect a
setOrigin = method1 "setOrigin(v1.x,v1.y)"

setTint :: forall a. Tint a => Number -> a -> Effect a
setTint = method1 "setTint(v1)"

getSize :: forall a. GameObject a => a -> Effect Dimensions
getSize a = do
  width <- getProperty "width" a
  height <- getProperty "height" a
  pure { width, height }

setSize :: forall a. GameObject a => Dimensions -> a -> Effect a
setSize = method1 "setSize(v1.width,v1.height)"

getWidth :: forall a. GameObject a => a -> Effect Number
getWidth = getProperty "width"

getHeight :: forall a. GameObject a => a -> Effect Number
getHeight = getProperty "height"

-- TODO: getDisplaySize  doesn't exist, replace with:
-- var displayWidth = gameObject.displayWidth;
-- var displayHeight = gameObject.displayHeight;

getDisplaySize :: forall a. GameObject a => a -> Effect Dimensions
getDisplaySize = return0 "getDisplaySize()"

setDisplaySize :: forall a. GameObject a => Dimensions -> a -> Effect a
setDisplaySize = method1 "setDisplaySize(v1.width, v1.height)"

setInteractive :: forall a. GameObject a => a -> Effect a
setInteractive = method0 "setInteractive()"

getScale :: forall a. Transform a => a -> Effect Vector
getScale a = do
  x <- getProperty "scaleX" a
  y <- getProperty "scaleY" a
  pure { x, y }

setScale :: forall a. Transform a => Vector -> a -> Effect a
setScale = method1 "setScale(v1.x,v1.y)"

setName :: forall a. GameObject a => String -> a -> Effect a
setName = method1 "setName(v1)"

getName :: forall a. GameObject a => a -> Effect String
getName = getProperty "name"
