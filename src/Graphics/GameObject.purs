module Graphics.Phaser.GameObject where

import Prelude
import Data.Maybe (Maybe)
import Effect (Effect)
import Graphics.Phaser.Container as Container
import Graphics.Phaser.CoreTypes (class GameObject, class Tint, class Transform, Dimensions, Vector)
import Graphics.Phaser.ForeignTypes (PhaserAnimation, PhaserContainer, PhaserGraphic, PhaserImage, PhaserRectangle, PhaserScene, PhaserSprite, PhaserText)
import Graphics.Phaser.Graphics as Graphics
import Graphics.Phaser.Image as Image
import Graphics.Phaser.Sprite (class Sprite)
import Graphics.Phaser.Sprite as Sprite
import Graphics.Phaser.Text as Text
import Utils.FFI (_getProp, _method0, _method1, _method2, _return0)

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

-- TODO: getDisplaySize  doesn't exist, replace with:
-- var displayWidth = gameObject.displayWidth;
-- var displayHeight = gameObject.displayHeight;
getDisplaySize :: forall a. GameObject a => a -> Effect Dimensions
getDisplaySize = _return0 "getDisplaySize"

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

image :: { create :: String -> PhaserScene -> Effect PhaserImage }
image = { create: Image.create }

container ::
  forall a.
  GameObject a =>
  { addChild :: a -> PhaserContainer -> Effect PhaserContainer
  , create :: PhaserScene -> Effect PhaserContainer
  , getByName :: String -> PhaserContainer -> Effect (Maybe a)
  , list :: PhaserContainer -> Effect (Array a)
  , removeAll :: Boolean -> PhaserContainer -> Effect PhaserContainer
  }
container =
  { create: Container.create
  , addChild: Container.addChild
  , removeAll: Container.removeAll
  , list: Container.list
  , getByName: Container.getByName
  }

text ::
  { create :: String -> PhaserScene -> Effect PhaserText
  , createFromArray :: Array String -> PhaserScene -> Effect PhaserText
  , getTextMetrics ::
      PhaserText ->
      Effect
        { ascent :: Number
        , descent :: Number
        , fontSize :: Number
        }
  , setColor :: String -> PhaserText -> Effect PhaserText
  , setFont :: String -> PhaserText -> Effect PhaserText
  , setFontFamily :: String -> PhaserText -> Effect PhaserText
  , setFontSize :: Number -> PhaserText -> Effect PhaserText
  , setFontStyle :: String -> PhaserText -> Effect PhaserText
  , setLineSpacing :: Number -> PhaserText -> Effect PhaserText
  , setMaxLines :: Number -> PhaserText -> Effect PhaserText
  , setPadding ::
      { bottom :: Number
      , left :: Number
      , right :: Number
      , top :: Number
      } ->
      PhaserText -> Effect PhaserText
  , setShadow :: PhaserText -> Effect PhaserText
  , setShadowBlur :: Number -> PhaserText -> Effect PhaserText
  , setShadowColor :: String -> PhaserText -> Effect PhaserText
  , setShadowFill :: String -> PhaserText -> Effect PhaserText
  , setShadowOffset ::
      { x :: Number
      , y :: Number
      } ->
      PhaserText -> Effect PhaserText
  , setShadowStroke :: Boolean -> PhaserText -> Effect PhaserText
  , setStroke :: String -> Number -> PhaserText -> Effect PhaserText
  , setStyle ::
      { align :: String
      , backgroundColor :: String
      , color :: String
      , fontFamily :: String
      , fontSize :: String
      } ->
      PhaserText -> Effect PhaserText
  , setText :: String -> PhaserText -> Effect PhaserText
  , updateText :: PhaserText -> Effect PhaserText
  }
text =
  { create: Text.create
  , createFromArray: Text.createFromArray
  , setText: Text.setText
  , getTextMetrics: Text.getTextMetrics
  , setColor: Text.setColor
  , setFontFamily: Text.setFontFamily
  , setFont: Text.setFont
  , setFontSize: Text.setFontSize
  , setFontStyle: Text.setFontStyle
  , setLineSpacing: Text.setLineSpacing
  , setMaxLines: Text.setMaxLines
  , setPadding: Text.setPadding
  , setShadowBlur: Text.setShadowBlur
  , setShadowColor: Text.setShadowColor
  , setShadowFill: Text.setShadowFill
  , setShadow: Text.setShadow
  , setShadowOffset: Text.setShadowOffset
  , setShadowStroke: Text.setShadowStroke
  , setStroke: Text.setStroke
  , setStyle: Text.setStyle
  , updateText: Text.updateText
  }

sprite ::
  { create ::
      { x :: Number
      , y :: Number
      } ->
      String -> PhaserScene -> Effect PhaserSprite
  , createAnimation ::
      String ->
      Array
        { frame :: Int
        , key :: String
        } ->
      Number -> Int -> PhaserScene -> Effect PhaserAnimation
  , generateFrameNames ::
      { end :: Int
      , key :: String
      , prefix :: String
      , start :: Int
      , zeroPad :: Int
      } ->
      PhaserScene -> Effect PhaserAnimation
  , generateFrameNumbers ::
      String ->
      Int ->
      Int ->
      PhaserScene ->
      Effect
        ( Array
            { frame :: Int
            , key :: String
            }
        )
  , playAnimation ::
      forall sprite.
      Sprite sprite =>
      { ignoreIfPlaying :: Boolean
      , key :: String
      } ->
      sprite -> Effect sprite
  , removeAnimation :: String -> PhaserSprite -> Effect PhaserSprite
  , setFrame :: Int -> PhaserSprite -> Effect PhaserSprite
  , stopAfterDelay :: Number -> PhaserSprite -> Effect PhaserSprite
  , stopAnimation :: PhaserSprite -> Effect PhaserSprite
  }
sprite =
  { create: Sprite.create
  , createAnimation: Sprite.createAnimation
  , playAnimation: Sprite.playAnimation
  , removeAnimation: Sprite.removeAnimation
  , stopAnimation: Sprite.stopAnimation
  , stopAfterDelay: Sprite.stopAfterDelay
  , generateFrameNumbers: Sprite.generateFrameNumbers
  , generateFrameNames: Sprite.generateFrameNames
  , setFrame: Sprite.setFrame
  }

graphics ::
  { create :: PhaserScene -> Effect PhaserGraphic
  , beginPath :: PhaserGraphic -> Effect PhaserGraphic
  , clear :: PhaserGraphic -> Effect PhaserGraphic
  , closePath :: PhaserGraphic -> Effect PhaserGraphic
  , fillGradientStyle ::
      { bottomLeft :: String
      , bottomRight :: String
      , topLeft :: String
      , topRight :: String
      } ->
      PhaserGraphic -> Effect PhaserGraphic
  , fillRect ::
      { x :: Number
      , y :: Number
      } ->
      { height :: Number
      , width :: Number
      } ->
      PhaserGraphic -> Effect PhaserGraphic
  , fillStyle :: String -> Number -> PhaserGraphic -> Effect PhaserGraphic
  , lineStyle ::
      { alpha :: Number
      , color :: String
      , width :: Number
      } ->
      PhaserGraphic -> Effect PhaserGraphic
  , lineTo ::
      { x :: Number
      , y :: Number
      } ->
      PhaserGraphic -> Effect PhaserGraphic
  , moveTo ::
      { x :: Number
      , y :: Number
      } ->
      PhaserGraphic -> Effect PhaserGraphic
  , rectangle :: PhaserScene -> Effect PhaserRectangle
  , strokePath :: PhaserGraphic -> Effect PhaserGraphic
  , strokeRect ::
      { x :: Number
      , y :: Number
      } ->
      { height :: Number
      , width :: Number
      } ->
      PhaserGraphic -> Effect PhaserGraphic
  , strokeRoundedRect ::
      { x :: Number
      , y :: Number
      } ->
      { height :: Number
      , width :: Number
      } ->
      Number -> PhaserGraphic -> Effect PhaserGraphic
  }
graphics =
  { create: Graphics.create
  , rectangle: Graphics.rectangle
  , fillStyle: Graphics.fillStyle
  , fillRect: Graphics.fillRect
  , strokeRect: Graphics.strokeRect
  , strokeRoundedRect: Graphics.strokeRoundedRect
  , lineStyle: Graphics.lineStyle
  , beginPath: Graphics.beginPath
  , moveTo: Graphics.moveTo
  , lineTo: Graphics.lineTo
  , closePath: Graphics.closePath
  , strokePath: Graphics.strokePath
  , fillGradientStyle: Graphics.fillGradientStyle
  , clear: Graphics.clear
  }
