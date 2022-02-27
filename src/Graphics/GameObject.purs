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
  , getTint
  , setTint
  , clearTint
  , isTinted
  , getSize
  , setSize
  , getWidth
  , getHeight
  , getDisplaySize
  , setDisplaySize
  , getScale
  , setScale
  , setName
  , getName
  ) where

import Prelude

import Effect (Effect)
import Effect.Uncurried (runEffectFn1, runEffectFn2, runEffectFn3)
import Graphics.Phaser.FFI as FFI
import Graphics.Phaser.ForeignTypes (Event, PhaserScene, PhaserGameObject, PhaserImage)

type Vector
  = { x :: Number, y :: Number }

type Dimensions
  = { width :: Number, height :: Number }

-- should also include other fns for oher GO events
type OnClickCallback a
  = Vector -> Vector -> Event -> a -> Effect Unit

class GameObject :: forall k. k -> Constraint
class GameObject a

class Image :: forall k. k -> Constraint
class GameObject a <= Image a

class Container :: forall k. k -> Constraint
class GameObject a <= Container a

class Graphics :: forall k. k -> Constraint
class GameObject a <= Graphics a

class Sprite :: forall k. k -> Constraint
class GameObject a <= Sprite a

createImage :: Image PhaserImage => String-> Vector->  PhaserScene -> Effect PhaserImage
createImage  texture {x,y} a = do
  add <- FFI.get "add" a -- replace with property-path util
  fn <- FFI.get "image" add
  runEffectFn3 fn x y texture

dostuff :: Image PhaserImage => PhaserScene -> Vector -> String -> Effect Number
dostuff scene vec key = do
  img <- createImage key vec scene
  getX img


-- *********************** --
-- || Local FFI Helpers || --
-- *********************** --
getProperty :: forall obj value. GameObject obj => String -> obj -> Effect value
getProperty = FFI.get 

setProperty :: forall obj value. GameObject obj => String -> value -> obj -> Effect obj
setProperty property value obj = do
  _ <- FFI.set property value obj
  pure obj

-- Calls a method from the object and returns the obtained value
callMethod1 :: forall obj v1 returnValue. GameObject obj => String -> v1 -> obj -> Effect returnValue
callMethod1 property value1 obj = do
  method <- FFI.get property obj
  runEffectFn1 method value1

-- Calls a method from the object and returns the object (1 argument method)
method1 :: forall obj v1. GameObject obj => String -> v1 -> obj -> Effect obj
method1 property value1 obj = do
  _ <- callMethod1 property value1 obj
  pure obj

-- Same as `method1`, but takes two argments
method2 :: forall obj v1 v2. GameObject obj => String -> v1 -> v2 -> obj -> Effect obj
method2 property value1 value2 obj = do
  method <- FFI.get property obj
  _ <- runEffectFn2 method value1 value2
  pure obj

-- ************************* --
-- || Phaser FFI Bindings || --
-- ************************* --
getScene :: forall a. GameObject a => a -> Effect PhaserScene
getScene = getProperty "scene"

destroy :: forall a. GameObject a => a -> Effect Unit
destroy a = do
  _ <- method1 "destroy" unit a -- TODO: does .destroy accepts a boolean?
  pure unit

getX :: forall a. GameObject a => a -> Effect Number
getX = getProperty "x"

getY :: forall a. GameObject a => a -> Effect Number
getY = getProperty "y"

getPosition :: forall a. GameObject a => a -> Effect Vector
getPosition a = do
  x <- getX a
  y <- getY a
  pure { x, y }

setPosition :: forall a. GameObject a => Vector -> a -> Effect a
setPosition = setProperty "setPosition"

getAngle :: forall a. GameObject a => a -> Effect Number
getAngle = getProperty "angle"

setAngle :: forall a. GameObject a => Number -> a -> Effect a
setAngle = setProperty "setAngle"

getRadians :: forall a. GameObject a => a -> Effect Number
getRadians = getProperty "radians"

setRadians :: forall a. GameObject a => Number -> a -> Effect a
setRadians = method1 "setRadians"

getVisible :: forall a. GameObject a => a -> Effect Boolean
getVisible = getProperty "visible"

setVisible :: forall a. GameObject a => Boolean -> a -> Effect a
setVisible = method1 "setVisible"

getAlpha :: forall a. GameObject a => a -> Effect Number
getAlpha = getProperty "alpha"

setAlpha :: forall a. GameObject a => Number -> a -> Effect a
setAlpha = method1 "alpha"

getOrigin :: forall a. GameObject a => a -> Effect Number
getOrigin = getProperty "origin"

setOrigin :: forall a. GameObject a => Vector -> a -> Effect a
setOrigin { x, y } = method2 "setOrigin" x y

setTint :: forall a. GameObject a => Number -> a -> Effect a
setTint = method1 "setTint"

getTint :: forall a. GameObject a => a -> Effect { tintBottomLeft :: Number, tintBottomRight :: Number, tintTopLeft :: Number, tintTopRight :: Number }
getTint a = do
  tintTopLeft <- getProperty "tintTolLeft" a
  tintTopRight <- getProperty "tintTopRight" a
  tintBottomLeft <- getProperty "tintBottomLeft" a
  tintBottomRight <- getProperty "tintBottomRight" a
  pure
    { tintTopLeft
    , tintTopRight
    , tintBottomLeft
    , tintBottomRight
    }

clearTint :: forall a. GameObject a => a -> Effect a
clearTint = method1 "getTint" unit

isTinted :: forall a. GameObject a => a -> Effect Boolean
isTinted = callMethod1 "isTinted" unit

getSize :: forall a. GameObject a => a -> Effect Dimensions
getSize a = do
  width <- getProperty "width" a
  height <- getProperty "height" a
  pure { width, height }

setSize :: forall a. GameObject a => Dimensions -> a -> Effect a
setSize { width, height } = method2 "setSize" width height

getWidth :: forall a. GameObject a => a -> Effect Number
getWidth = getProperty "width"

getHeight :: forall a. GameObject a => a -> Effect Number
getHeight = getProperty "height"

getDisplaySize :: forall a. GameObject a => a -> Effect Dimensions
getDisplaySize = callMethod1 "getDisplaySize" unit

setDisplaySize :: forall a. GameObject a => Dimensions -> a -> Effect a
setDisplaySize { width, height } = method2 "setDisplaySize" width height

getScale :: forall a. GameObject a => a -> Effect Vector
getScale a = do
  x <- getProperty "scaleX" a
  y <- getProperty "scaleY" a
  pure { x, y }

setScale :: forall a. GameObject a => Vector -> a -> Effect a
setScale { x, y } = method2 "setScale" x y

setName :: forall a. GameObject a => String -> a -> Effect a
setName = method1 "name"

getName :: forall a. GameObject a => a -> Effect String
getName = getProperty "name"
