module Graphics.Phaser.Graphics (PhaserGraphic, solidRect, gradientRect) where

import Data.Function.Uncurried (Fn4, runFn2, runFn4)
import Effect (Effect)
import Graphics.Phaser.GameObject as GO
import Graphics.Phaser.Scene (PhaserScene)

foreign import data PhaserGraphic :: Type

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

-- | Implements the GameObject type class
instance graphicsInstance :: GO.GameObject PhaserGraphic where
  destroy i = GO.destroyImpl i
  getPosition i = GO.getPositionImpl i
  setPosition i = runFn2 GO.setPositionImpl i
  getAngle i = GO.getAngleImpl i
  setAngle i = runFn2 GO.setAngleImpl i
  getRadians i = GO.getRadiansImpl i
  setRadians i = runFn2 GO.setRadiansImpl i
  getVisible i = GO.getVisibleImpl i
  setVisible i = runFn2 GO.setVisibleImpl i
  getAlpha i = GO.getAlphaImpl i
  setAlpha i = runFn2 GO.setAlphaImpl i
  getOrigin i = GO.getOriginImpl i
  setOrigin i = runFn2 GO.setOriginImpl i
  clearTint i = GO.clearTintImpl i
  setTint i = runFn2 GO.setTintImpl i
  getSize i = GO.getSizeImpl i
  setSize i = runFn2 GO.setSizeImpl i
  getDisplaySize i = GO.getSizeImpl i
  setDisplaySize i = runFn2 GO.setSizeImpl i
  getScale i = GO.getScaleImpl i
  setScale i = runFn2 GO.setScaleImpl i
  getName i = GO.getNameImpl i
  setName i = runFn2 GO.setNameImpl i
  onClick i = runFn2 GO.onClickImpl i
