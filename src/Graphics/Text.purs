module Graphics.Phaser.Text where

import Data.Function.Uncurried (runFn2)
import Effect (Effect)
import Graphics.Phaser.GameObject as GO
import Graphics.Phaser.Scene (PhaserScene)

foreign import data PhaserText :: Type

foreign import text ::
  { scene :: PhaserScene
  , pos :: { x :: Number, y :: Number }
  , text :: String
  , config :: { color :: String, fontSize :: Int, fontFamily :: String }
  } ->
  Effect PhaserText

-- | Implements the GameObject type class
instance textInstance :: GO.GameObject PhaserText where
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
