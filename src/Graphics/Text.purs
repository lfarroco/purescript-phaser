module Graphics.Phaser.Text where

-- https://photonstorm.github.io/phaser3-docs/Phaser.GameObjects.Text.html
import Prelude
import Effect (Effect)
import Graphics.Phaser.CoreTypes (Vector)
import Graphics.Phaser.ForeignTypes (PhaserScene, PhaserText)
import Utils.FFI (_getProp, _method0, _method1, _method2, _method4, _return0, _return3, method5)

create :: String -> PhaserScene -> Effect PhaserText
create v1 = _getProp "add" >=> _return3 "text" 0.0 0.0 v1

createFromArray :: Array String -> PhaserScene -> Effect PhaserText
createFromArray v1 = _getProp "add" >=> _return3 "text" 0.0 0.0 v1

setText :: String -> PhaserText -> Effect PhaserText
setText = _method1 "setText"

type PhaserTextMetrics
  = { ascent :: Number, descent :: Number, fontSize :: Number }

getTextMetrics :: PhaserText -> Effect PhaserTextMetrics
getTextMetrics = _return0 "getTextMetrics"

setColor :: String -> PhaserText -> Effect PhaserText
setColor = _method1 "setColor"

setFontFamily :: String -> PhaserText -> Effect PhaserText
setFontFamily = _method1 "setFontFamily"

setFont :: String -> PhaserText -> Effect PhaserText
setFont = _method1 "setFont"

setFontSize :: Number -> PhaserText -> Effect PhaserText
setFontSize = _method1 "setFontSize"

setFontStyle :: String -> PhaserText -> Effect PhaserText
setFontStyle = _method1 "setFontStyle"

setLineSpacing :: Number -> PhaserText -> Effect PhaserText
setLineSpacing = _method1 "setLineSpacing"

setMaxLines :: Number -> PhaserText -> Effect PhaserText
setMaxLines = _method1 "setMaxLines"

type SetPaddingConfig
  = { left :: Number, top :: Number, right :: Number, bottom :: Number }

setPadding :: SetPaddingConfig -> PhaserText -> Effect PhaserText
setPadding { left, top, right, bottom } = _method4 "setPadding" left top right bottom

setShadowBlur :: Number -> PhaserText -> Effect PhaserText
setShadowBlur = _method1 "setShadowBlur"

setShadowColor :: String -> PhaserText -> Effect PhaserText
setShadowColor = _method1 "setShadowColor"

setShadowFill :: String -> PhaserText -> Effect PhaserText
setShadowFill = _method1 "setShadowFill"

-- | Position, Color, Blur, shadowStroke, shadowFill
setShadow :: Vector -> String -> Number -> Boolean -> Boolean -> PhaserText -> Effect PhaserText
setShadow = method5 "setShadow(v1.x,v1.y,v2,v3,v4)"

setShadowOffset :: Vector -> PhaserText -> Effect PhaserText
setShadowOffset = _method1 "setShadowOffset"

setShadowStroke :: Boolean -> PhaserText -> Effect PhaserText
setShadowStroke = _method1 "setShadowStroke"

-- | Color, Thickness
setStroke :: String -> Number -> PhaserText -> Effect PhaserText
setStroke = _method2 "setStroke"

type SetStyleConfig
  = { fontSize :: String
    , fontFamily :: String
    , color :: String
    , align :: String
    , backgroundColor :: String
    }

setStyle :: SetStyleConfig -> PhaserText -> Effect PhaserText
setStyle = _method1 "setStyle"

updateText :: PhaserText -> Effect PhaserText
updateText = _method0 "updateText"
