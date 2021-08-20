module Graphics.Phaser.Graphics (solidRect, gradientRect) where

import Data.Function.Uncurried (Fn4, runFn4)
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserGraphic, PhaserScene)

foreign import solidRectImpl :: Fn4 { x :: Number, y :: Number } { width :: Number, height :: Number } String PhaserScene (Effect PhaserGraphic)

solidRect ::
  { x :: Number, y :: Number } ->
  { width :: Number, height :: Number } ->
  String -> PhaserScene -> Effect PhaserGraphic
solidRect pos size color scene = runFn4 solidRectImpl pos size color scene

foreign import gradientRectImpl ::
  Fn4
    { x :: Number, y :: Number }
    { width :: Number, height :: Number }
    { topLeft :: String
    , topRight :: String
    , bottomLeft :: String
    , bottomRight :: String
    }
    PhaserScene
    (Effect PhaserGraphic)

gradientRect ::
  { x :: Number, y :: Number } ->
  { height :: Number, width :: Number } ->
  { bottomLeft :: String
  , bottomRight :: String
  , topLeft :: String
  , topRight :: String
  } ->
  PhaserScene -> Effect PhaserGraphic
gradientRect pos size gradients scene = runFn4 gradientRectImpl pos size gradients scene
