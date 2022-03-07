module Graphics.Phaser.Graphics where

import Effect (Effect)
import Graphics.Phaser.CoreTypes (Vector, Dimensions)
import Graphics.Phaser.ForeignTypes as Types
import Utils.FFI (method0, method1, method2, method3, return0)

create :: Types.PhaserScene -> Effect Types.PhaserGraphic
create = return0 "add.graphics()"

rectangle :: Types.PhaserScene -> Effect Types.PhaserRectangle
rectangle = return0 "add.rectangle()"

fillStyle :: String -> Number -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
fillStyle = method2 "fillStyle(v1,v2)"

fillRect :: Vector -> Dimensions -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
fillRect =  method2 "fillRect(v1.x, v1.y, v2.width, v2.height)"

strokeRect :: Vector -> Dimensions -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
strokeRect  =  method2 "strokeRect (v1.x, v1.y, v2.width, v2.height)"

strokeRoundedRect :: Vector -> Dimensions -> Number -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
strokeRoundedRect   =  method3 "strokeRoundedRect(v1.x, v1.y, v2.width, v2.height, v3)"

type LineStyleConfig
  = { width :: Number, color :: String, alpha :: Number }

lineStyle :: LineStyleConfig -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
lineStyle = method1 "lineStyle(v1.width, v1.color, v1.alpha)"

beginPath :: Types.PhaserGraphic -> Effect Types.PhaserGraphic
beginPath = method0 "beginPath()"

moveTo :: Vector -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
moveTo = method1 "moveTo(v1.x,v1.y)"

lineTo :: Vector -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
lineTo  = method1 "lineTo (v1.x,v1.y)"

closePath :: Types.PhaserGraphic -> Effect Types.PhaserGraphic
closePath = method0 "closePath()"

strokePath :: Types.PhaserGraphic -> Effect Types.PhaserGraphic
strokePath = method0 "strokePath()"

type FillGradientConfig
  = { topLeft :: String
    , topRight :: String
    , bottomLeft :: String
    , bottomRight :: String
    }

fillGradientStyle :: FillGradientConfig -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
fillGradientStyle = method1 "fillGradientStyle(v1.topLeft,v1.topRight,v1.bottomLeft,v1.bottomRight)"

clear :: Types.PhaserGraphic -> Effect Types.PhaserGraphic
clear = method0 "clear()"
