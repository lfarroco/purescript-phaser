module Graphics.Phaser.Graphics where

import Data.Function.Uncurried (Fn2, runFn2, Fn3, runFn3, Fn4, runFn4)
import Effect (Effect)
import Graphics.Phaser.ForeignTypes as Types
import Graphics.Phaser.GameObject (Vector, Dimensions)

foreign import create :: Types.PhaserScene -> Effect Types.PhaserGraphic

foreign import rectangleImpl :: Fn3 Vector Dimensions Types.PhaserScene (Effect Types.PhaserRectangle)

rectangle :: Vector -> Dimensions -> Types.PhaserScene -> Effect Types.PhaserRectangle
rectangle = runFn3 rectangleImpl

foreign import fillStyleImpl :: Fn3 String Number Types.PhaserGraphic (Effect Types.PhaserGraphic)

fillStyle :: String -> Number -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
fillStyle = runFn3 fillStyleImpl

foreign import fillRectImpl :: Fn3 Vector Dimensions Types.PhaserGraphic (Effect Types.PhaserGraphic)

fillRect :: Vector -> Dimensions -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
fillRect = runFn3 fillRectImpl

foreign import strokeRectImpl :: Fn3 Vector Dimensions Types.PhaserGraphic (Effect Types.PhaserGraphic)

strokeRect :: Vector -> Dimensions -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
strokeRect = runFn3 strokeRectImpl

foreign import strokeRoundedRectImpl :: Fn4 Vector Dimensions Number Types.PhaserGraphic (Effect Types.PhaserGraphic)

strokeRoundedRect :: Vector -> Dimensions -> Number -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
strokeRoundedRect = runFn4 strokeRoundedRectImpl

type LineStyleConfig = { width:: Number, color :: String, alpha:: Number}

foreign import lineStyleImpl :: Fn2 LineStyleConfig Types.PhaserGraphic (Effect Types.PhaserGraphic)

lineStyle:: LineStyleConfig -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
lineStyle= runFn2 lineStyleImpl   

foreign import beginPath :: Types.PhaserGraphic -> Effect Types.PhaserGraphic

foreign import moveToImpl :: Fn2 Vector Types.PhaserGraphic (Effect Types.PhaserGraphic)

moveTo :: Vector -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
moveTo = runFn2 moveToImpl

foreign import lineToImpl :: Fn2 Vector Types.PhaserGraphic (Effect Types.PhaserGraphic)

lineTo :: Vector -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
lineTo = runFn2 lineToImpl

foreign import closePath :: Types.PhaserGraphic -> Effect Types.PhaserGraphic

foreign import strokePath :: Types.PhaserGraphic -> Effect Types.PhaserGraphic

foreign import fillGradientStyleImpl :: Fn2
  { topLeft :: String
  , topRight :: String
  , bottomLeft :: String
  , bottomRight :: String
  }
    Types.PhaserGraphic 
  (Effect Types.PhaserGraphic)
fillGradientStyle  :: { topLeft :: String
  , topRight :: String
  , bottomLeft :: String
  , bottomRight :: String
  }->
    Types.PhaserGraphic ->
  Effect Types.PhaserGraphic
fillGradientStyle = runFn2 fillGradientStyleImpl
