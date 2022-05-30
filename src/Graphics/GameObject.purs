module Graphics.Phaser.GameObject
  ( clearTint
  , destroy
  , getAlpha
  , getAngle
  , getDisplaySize
  , getHeight
  , getName
  , getOrigin
  , getPosition
  , getRadians
  , getRotation
  , getScale
  , getScene
  , getSize
  , getTint
  , getVisible
  , getWidth
  , getX
  , getY
  , isTinted
  , setAlpha
  , setAngle
  , setDisplaySize
  , setInteractive
  , setName
  , setOrigin
  , setPosition
  , setRadians
  , setRotation
  , setScale
  , setSize
  , setTint
  , setVisible
  , setX
  , setY
  ) where

import Prelude
import Effect (Effect)
import Graphics.Phaser.CoreTypes (class GameObject, class Tint, class Transform, Dimensions, Vector)
import Graphics.Phaser.ForeignTypes (PhaserScene)
import Utils.FFI (_getProp, _method)

getScene :: forall a. GameObject a => a -> Effect PhaserScene
getScene = _getProp "scene"

destroy :: forall a. GameObject a => a -> Effect Unit
destroy = _method "destroy" []

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
setPosition { x, y } = _method "setPosition" [ x, y ]

setX :: forall a. Transform a => Number -> a -> Effect a
setX x = _method "setX" [ x ]

setY :: forall a. Transform a => Number -> a -> Effect a
setY y = _method "setY" [ y ]

getAngle :: forall a. Transform a => a -> Effect Number
getAngle = _getProp "angle"

setAngle :: forall a. Transform a => Number -> a -> Effect a
setAngle angle = _method "setAngle" [ angle ]

getRadians :: forall a. Transform a => a -> Effect Number
getRadians = _getProp "radians"

setRadians :: forall a. Transform a => Number -> a -> Effect a
setRadians rad = _method "setRadians" [ rad ]

-- The angle in radians.
getRotation :: forall a. Transform a => a -> Effect Number
getRotation = _getProp "rotation"

setRotation :: forall a. Transform a => Number -> a -> Effect a
setRotation rot = _method "setRotation" [ rot ]

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
clearTint = _method "clearTint" []

isTinted :: forall a. Tint a => a -> Effect Boolean
isTinted = _getProp "isTinted"

getVisible :: forall a. GameObject a => a -> Effect Boolean
getVisible = _getProp "visible"

setVisible :: forall a. GameObject a => Boolean -> a -> Effect a
setVisible visible = _method "setVisible" [ visible ]

getAlpha :: forall a. GameObject a => a -> Effect Number
getAlpha = _getProp "alpha"

setAlpha :: forall a. GameObject a => Number -> a -> Effect a
setAlpha alpha = _method "setAlpha" [ alpha ]

getOrigin :: forall a. GameObject a => a -> Effect Number
getOrigin = _getProp "origin"

setOrigin :: forall a. GameObject a => Vector -> a -> Effect a
setOrigin { x, y } = _method "setOrigin" [ x, y ]

setTint :: forall a. Tint a => Number -> a -> Effect a
setTint color = _method "setTint" [ color ]

getSize :: forall a. GameObject a => a -> Effect Dimensions
getSize a = do
  width <- _getProp "width" a
  height <- _getProp "height" a
  pure { width, height }

setSize :: forall a. GameObject a => Dimensions -> a -> Effect a
setSize { width, height } = _method "setSize" [ width, height ]

getWidth :: forall a. GameObject a => a -> Effect Number
getWidth = _getProp "width"

getHeight :: forall a. GameObject a => a -> Effect Number
getHeight = _getProp "height"

-- TODO: getDisplaySize  doesn't exist, replace with:
-- var displayWidth = gameObject.displayWidth;
-- var displayHeight = gameObject.displayHeight;
getDisplaySize :: forall a. GameObject a => a -> Effect Dimensions
getDisplaySize = _method "getDisplaySize" []

setDisplaySize :: forall a. GameObject a => Dimensions -> a -> Effect a
setDisplaySize { width, height } = _method "setDisplaySize" [ width, height ]

setInteractive :: forall a. GameObject a => a -> Effect a
setInteractive = _method "setInteractive" []

getScale :: forall a. Transform a => a -> Effect Vector
getScale a = do
  x <- _getProp "scaleX" a
  y <- _getProp "scaleY" a
  pure { x, y }

setScale :: forall a. Transform a => Vector -> a -> Effect a
setScale { x, y } = _method "setScale" [ x, y ]

setName :: forall a. GameObject a => String -> a -> Effect a
setName name = _method "setName" [ name ]

getName :: forall a. GameObject a => a -> Effect String
getName = _getProp "name"
