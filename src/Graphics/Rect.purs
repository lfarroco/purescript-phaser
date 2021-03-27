module Graphics.Phaser.Rect where

import Effect (Effect)
import Graphics.Phaser.Scene (PhaserScene)

foreign import data PhaserGraphic :: Type

foreign import solidColorRect :: { x :: Number, y :: Number } -> { width :: Number, height :: Number } -> String -> PhaserScene -> Effect PhaserGraphic

foreign import gradientRect ::
  { x :: Number, y :: Number } ->
  { width :: Number, height :: Number } ->
  { topLeft :: String
  , topRight :: String
  , bottomLeft :: String
  , bottomRight :: String
  } -> PhaserScene -> Effect PhaserGraphic
