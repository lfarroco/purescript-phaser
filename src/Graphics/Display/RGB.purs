module Graphics.Phaser.Display.RGB where

--
-- https://newdocs.phaser.io/docs/3.55.1/Phaser.Display.RGB
-- Status: Complete
--
import Prelude
import Data.Foreign.SmallFFI (unsafeForeignFunction)
import Effect (Effect)
import Graphics.Phaser.CoreTypes (EventListener)
import Graphics.Phaser.ForeignTypes (PhaserRGB)
import Utils.FFI (_getProp, _method0, _method3, _return3, _setProp)

new :: Number -> Number -> Number -> Effect PhaserRGB
new = unsafeForeignFunction [ "r", "g", "b", "" ] "new RGB(r,g,b)" r g b

r :: PhaserRGB -> Effect Number
r = _getProp "r"

g :: PhaserRGB -> Effect Number
g = _getProp "g"

b :: PhaserRGB -> Effect Number
b = _getProp "b"

setR :: Number -> PhaserRGB -> Effect PhaserRGB
setR = _setProp "r"

setG :: Number -> PhaserRGB -> Effect PhaserRGB
setG = _setProp "g"

setB :: Number -> PhaserRGB -> Effect PhaserRGB
setB = _setProp "b"

dirty :: PhaserRGB -> Effect Boolean
dirty = _getProp "dirty"

onChangeCallback :: EventListener -> PhaserRGB -> Effect PhaserRGB
onChangeCallback = _setProp "onChangeCallback"

destroy :: PhaserRGB -> Effect Unit
destroy rgb = do
  _ <- _method0 "destroy" rgb
  pure unit

equals :: Number -> Number -> Number -> PhaserRGB -> Effect Boolean
equals = _return3 "equals"

set :: Number -> Number -> Number -> PhaserRGB -> Effect PhaserRGB
set = _method3 "set"
