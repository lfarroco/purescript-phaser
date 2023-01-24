module Graphics.Phaser.Graphics where

import Prelude
import Effect (Effect)
import Graphics.Canvas (Composite(..))
import Graphics.Phaser.CoreTypes (Vector, Dimensions)
import Graphics.Phaser.ForeignTypes as Types
import Utils.FFI (_getProp, _method0, _method2, _method3, _method4, _method5, _return0)

create :: Types.PhaserScene -> Effect Types.PhaserGraphic
create = _getProp "add" >=> _return0 "graphics"

rectangle :: Types.PhaserScene -> Effect Types.PhaserRectangle
rectangle = _getProp "add" >=> _return0 "rectangle"

fillStyle :: Int -> Number -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
fillStyle = _method2 "fillStyle"

fillRect :: Vector -> Dimensions -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
fillRect { x, y } { width, height } = _method4 "fillRect" x y width height

strokeRect :: Vector -> Dimensions -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
strokeRect { x, y } { width, height } = _method4 "strokeRect" x y width height

strokeRoundedRect :: Vector -> Dimensions -> Number -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
strokeRoundedRect { x, y } { width, height } v3 = _method5 "strokeRoundedRect" x y width height v3

type LineStyleConfig
  = { width :: Number, color :: Int, alpha :: Number }

lineStyle :: LineStyleConfig -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
lineStyle { width, color, alpha } = _method3 "lineStyle" width color alpha

beginPath :: Types.PhaserGraphic -> Effect Types.PhaserGraphic
beginPath = _method0 "beginPath"

moveTo :: Vector -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
moveTo { x, y } = _method2 "moveTo" x y

lineTo :: Vector -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
lineTo { x, y } = _method2 "lineTo" x y

closePath :: Types.PhaserGraphic -> Effect Types.PhaserGraphic
closePath = _method0 "closePath"

strokePath :: Types.PhaserGraphic -> Effect Types.PhaserGraphic
strokePath = _method0 "strokePath"

type FillGradientConfig
  = { topLeft :: String
    , topRight :: String
    , bottomLeft :: String
    , bottomRight :: String
    }

fillGradientStyle :: FillGradientConfig -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
fillGradientStyle { topLeft, topRight, bottomLeft, bottomRight } = _method4 "fillGradientStyle" topLeft topRight bottomLeft bottomRight

clear :: Types.PhaserGraphic -> Effect Types.PhaserGraphic
clear = _method0 "clear"
