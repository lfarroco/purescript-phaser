module Graphics.Phaser.GameObject
  ( Vector
  , Dimensions
  , OnClickCallback
  , class GameObject
  , class Container
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

import Data.Foreign.EasyFFI as FFI
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (Event, PhaserImage, PhaserScene)

type Vector
  = { x :: Number, y :: Number }

type Dimensions
  = { width :: Number, height :: Number }

-- should also include other fns for oher GO events
type OnClickCallback a
  = Vector -> Vector -> Event -> a -> Effect Unit

class GameObject :: forall k. k -> Constraint
class GameObject a

instance GameObject PhaserImage

class Container :: forall k. k -> Constraint
class GameObject a <= Container a

class Graphics :: forall k. k -> Constraint
class GameObject a <= Graphics a

class Sprite :: forall k. k -> Constraint
class GameObject a <= Sprite a

-- FFI Helprs

objMethod  :: forall a value. GameObject a => Array String -> String -> value -> a -> Effect a
objMethod args expr value a  = do
  _ <- FFI.unsafeForeignFunction (args <> [""]) expr value a
  pure a

returnMethod  :: forall a value returned. GameObject a => Array String -> String -> value -> a -> Effect returned
returnMethod = FFI.unsafeForeignFunction 

get :: forall a returnValue. GameObject a => String -> a -> Effect returnValue
get name = FFI.unsafeForeignFunction ["obj", ""] ("obj." <> name)

-- Phaser Bindings

getScene :: forall a. GameObject a => a -> Effect PhaserScene
getScene = get "scene"

destroy :: forall a. GameObject a => a -> Effect Unit
destroy = FFI.unsafeForeignFunction ["obj", ""] "obj.destroy()"

getX :: forall a. GameObject a => a -> Effect Number
getX = get "x"

getY :: forall a. GameObject a => a -> Effect Number
getY = get "y"

getPosition :: forall a. GameObject a => a -> Effect Vector
getPosition a = do
  x <- getX a
  y <- getY a
  pure { x, y }

setPosition :: forall a. GameObject a => Vector -> a -> Effect a
setPosition  = objMethod ["vec", "obj"] "obj.setPosition(vec.x,vec.y)"

getAngle :: forall a. GameObject a => a -> Effect Number
getAngle = get "angle"

setAngle :: forall a. GameObject a => Number -> a -> Effect a
setAngle =  objMethod ["value", "obj"] "obj.setAngle(value)"

getRadians :: forall a. GameObject a => a -> Effect Number
getRadians = get "radians"

setRadians :: forall a. GameObject a => Number -> a -> Effect a
setRadians  =  objMethod  ["value", "obj"] "obj.setRadians(value)"

getVisible :: forall a. GameObject a => a -> Effect Boolean
getVisible = get "visible"

setVisible :: forall a. GameObject a => Boolean -> a -> Effect a
setVisible   =  objMethod  ["value", "obj"] "obj.setVisible(value)"

getAlpha :: forall a. GameObject a => a -> Effect Number
getAlpha = get "alpha"

setAlpha :: forall a. GameObject a => Number -> a -> Effect a
setAlpha =  objMethod  ["value", "obj"] "obj.setAlpha(value)"

getOrigin :: forall a. GameObject a => a -> Effect Number
getOrigin = get "origin"

setOrigin :: forall a. GameObject a => Vector -> a -> Effect a
setOrigin = objMethod ["vec", "obj"] "obj.setOrigin(vec.x,vec.y)" 

setTint :: forall a. GameObject a => Number -> a -> Effect a
setTint = objMethod  ["value", "obj"] "obj.setTint(value)"

getTint :: forall a. GameObject a => a -> Effect { tintBottomLeft :: Number, tintBottomRight :: Number, tintTopLeft :: Number, tintTopRight :: Number }
getTint a = do
  tintTopLeft <- get "tintTopLeft" a
  tintTopRight <- get "tintTopRight" a
  tintBottomLeft <- get "tintBottomLeft" a
  tintBottomRight <- get "tintBottomRight" a
  pure
    { tintTopLeft
    , tintTopRight
    , tintBottomLeft
    , tintBottomRight
    }

clearTint :: forall a. GameObject a => a -> Effect a
clearTint = objMethod ["obj"] "obj.clearTint()" {}

isTinted :: forall a. GameObject a => a -> Effect Boolean
isTinted = get "isTinted"

getSize :: forall a. GameObject a => a -> Effect Dimensions
getSize a = do
  width <- get "width" a
  height <- get "height" a
  pure { width, height }

setSize :: forall a. GameObject a => Dimensions -> a -> Effect a
setSize =  objMethod ["size", "obj"] "obj.setSize(size.width,size.height)" 

getWidth :: forall a. GameObject a => a -> Effect Number
getWidth = get "width"

getHeight :: forall a. GameObject a => a -> Effect Number
getHeight = get "height"

getDisplaySize :: forall a. GameObject a => a -> Effect Dimensions
getDisplaySize = returnMethod ["_unit", "obj"] "obj.getDisplaySize()" {}

setDisplaySize :: forall a. GameObject a => Dimensions -> a -> Effect a
setDisplaySize = objMethod ["size", "obj"] "obj.setDisplaySize(size.width, size.height)"

getScale :: forall a. GameObject a => a -> Effect Vector
getScale a = do
  x <- get "scaleX" a
  y <- get "scaleY" a
  pure { x, y }

setScale :: forall a. GameObject a => Vector -> a -> Effect a
setScale = objMethod ["vec", "obj"] "obj.setScale(vec.x,vec.y)"

setName :: forall a. GameObject a => String -> a -> Effect a
setName = objMethod ["name", "obj"] "obj.setName(name)"

getName :: forall a. GameObject a => a -> Effect String
getName = get "name"
