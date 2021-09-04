module Graphics.Phaser.Graphics
  ( create
  , rectangle
  , fillGradientStyle
  , lineTo
  , moveTo
  , lineStyle
  , strokeRect
  , fillStyle
  , fillRect
  , strokeRoundedRect
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, EffectFn4, runEffectFn2, runEffectFn3, runEffectFn4)
import Graphics.Phaser.ForeignTypes as Types
import Graphics.Phaser.GameObject (Vector, Dimensions)

foreign import create :: Types.PhaserScene -> Effect Types.PhaserGraphic

foreign import rectangleImpl :: EffectFn3 Vector Dimensions Types.PhaserScene Types.PhaserRectangle

rectangle :: Vector -> Dimensions -> Types.PhaserScene -> Effect Types.PhaserRectangle
rectangle = runEffectFn3 rectangleImpl

foreign import fillStyleImpl :: EffectFn3 String Number Types.PhaserGraphic Types.PhaserGraphic

fillStyle :: String -> Number -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
fillStyle = runEffectFn3 fillStyleImpl

foreign import fillRectImpl :: EffectFn3 Vector Dimensions Types.PhaserGraphic Types.PhaserGraphic

fillRect :: Vector -> Dimensions -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
fillRect = runEffectFn3 fillRectImpl

foreign import strokeRectImpl :: EffectFn3 Vector Dimensions Types.PhaserGraphic Types.PhaserGraphic

strokeRect :: Vector -> Dimensions -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
strokeRect = runEffectFn3 strokeRectImpl

foreign import strokeRoundedRectImpl :: EffectFn4 Vector Dimensions Number Types.PhaserGraphic Types.PhaserGraphic

strokeRoundedRect :: Vector -> Dimensions -> Number -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
strokeRoundedRect = runEffectFn4 strokeRoundedRectImpl

type LineStyleConfig
  = { width :: Number, color :: String, alpha :: Number }

foreign import lineStyleImpl :: EffectFn2 LineStyleConfig Types.PhaserGraphic Types.PhaserGraphic

lineStyle :: LineStyleConfig -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
lineStyle = runEffectFn2 lineStyleImpl

foreign import beginPath :: Types.PhaserGraphic -> Effect Types.PhaserGraphic

foreign import moveToImpl :: EffectFn2 Vector Types.PhaserGraphic Types.PhaserGraphic

moveTo :: Vector -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
moveTo = runEffectFn2 moveToImpl

foreign import lineToImpl :: EffectFn2 Vector Types.PhaserGraphic Types.PhaserGraphic

lineTo :: Vector -> Types.PhaserGraphic -> Effect Types.PhaserGraphic
lineTo = runEffectFn2 lineToImpl

foreign import closePath :: Types.PhaserGraphic -> Effect Types.PhaserGraphic

foreign import strokePath :: Types.PhaserGraphic -> Effect Types.PhaserGraphic

type FillGradientConfig
  = { topLeft :: String
    , topRight :: String
    , bottomLeft :: String
    , bottomRight :: String
    }

foreign import fillGradientStyleImpl ::
  EffectFn2
    FillGradientConfig
    Types.PhaserGraphic
    Types.PhaserGraphic

fillGradientStyle ::
  FillGradientConfig ->
  Types.PhaserGraphic ->
  Effect Types.PhaserGraphic
fillGradientStyle = runEffectFn2 fillGradientStyleImpl
