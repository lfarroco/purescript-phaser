module Graphics.Phaser.Graphics where

import Prelude
import Effect (Effect)
import Graphics.Phaser.CoreTypes (Vector, Dimensions)
import Graphics.Phaser.ForeignTypes as Types
import Utils.FFI (_method, _getProp, method1, method2, method3)

create :: Types.PhaserScene -> Effect Types.PhaserGraphic
create = _getProp "add" >=> _method "graphics" []

rectangle :: Types.PhaserScene -> Effect Types.PhaserRectangle
rectangle = _getProp "add" >=> _method "rectangle" []

fillStyle :: String -> Number -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
fillStyle = method2 "fillStyle(v1,v2)"

fillRect :: Vector -> Dimensions -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
fillRect = method2 "fillRect(v1.x, v1.y, v2.width, v2.height)"

strokeRect :: Vector -> Dimensions -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
strokeRect = method2 "strokeRect (v1.x, v1.y, v2.width, v2.height)"

strokeRoundedRect :: Vector -> Dimensions -> Number -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
strokeRoundedRect = method3 "strokeRoundedRect(v1.x, v1.y, v2.width, v2.height, v3)"

type LineStyleConfig
  = { width :: Number, color :: String, alpha :: Number }

lineStyle :: LineStyleConfig -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
lineStyle = method1 "lineStyle(v1.width, v1.color, v1.alpha)"

beginPath :: Types.PhaserGraphic -> Effect Types.PhaserGraphic
beginPath = _method "beginPath" []

moveTo :: Vector -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
moveTo = method1 "moveTo(v1.x,v1.y)"

lineTo :: Vector -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
lineTo = method1 "lineTo (v1.x,v1.y)"

closePath :: Types.PhaserGraphic -> Effect Types.PhaserGraphic
closePath = _method "closePath" []

strokePath :: Types.PhaserGraphic -> Effect Types.PhaserGraphic
strokePath = _method "strokePath" []

type FillGradientConfig
  = { topLeft :: String
    , topRight :: String
    , bottomLeft :: String
    , bottomRight :: String
    }

fillGradientStyle :: FillGradientConfig -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
fillGradientStyle = method1 "fillGradientStyle(v1.topLeft,v1.topRight,v1.bottomLeft,v1.bottomRight)"

clear :: Types.PhaserGraphic -> Effect Types.PhaserGraphic
clear = _method "clear" []
