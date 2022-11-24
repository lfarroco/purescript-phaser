module Graphics.Phaser.Curves where

import Data.Foreign.SmallFFI (unsafeForeignProcedure)
import Effect (Effect)
import Graphics.Phaser.CoreTypes (Vector)
import Graphics.Phaser.ForeignTypes (PhaserCurveSpline, PhaserGraphic)
import Utils.FFI (_method2, _return0, _return1)

newSpline :: Array Number -> Effect PhaserCurveSpline
newSpline = unsafeForeignProcedure [ "points", "" ] "return new Phaser.Curves.Spline(points)"

draw :: PhaserGraphic -> Int -> PhaserCurveSpline -> Effect PhaserCurveSpline
draw = _method2 "draw"

addPoint :: { x :: Number, y :: Number } -> PhaserCurveSpline -> Effect PhaserCurveSpline
addPoint { x, y } = _method2 "addPoint" x y

getPoint :: Number -> PhaserCurveSpline -> Effect { x :: Number, y :: Number }
getPoint = _return1 "getPoint"

getLength :: PhaserCurveSpline -> Effect Number
getLength = _return0 "getLength"

getTangent :: Number -> PhaserCurveSpline -> Effect Vector
getTangent = _return1 "getTangent"
