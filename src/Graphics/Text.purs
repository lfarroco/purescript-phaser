module Graphics.Phaser.Text where

-- https://photonstorm.github.io/phaser3-docs/Phaser.GameObjects.Text.html
import Effect (Effect)
import Graphics.Phaser.CoreTypes (Vector)
import Graphics.Phaser.ForeignTypes (PhaserScene, PhaserText)
import Utils.FFI (_method0, method1, method2, method5, _return0, return1)

create :: String -> PhaserScene -> Effect PhaserText
create = return1 "add.text(0,0,v1)"

createFromArray :: Array String -> PhaserScene -> Effect PhaserText
createFromArray = return1 "add.text(0,0,v1)"

setText :: String -> PhaserText -> Effect PhaserText
setText = method1 "setText(v1)"

type PhaserTextMetrics
  = { ascent :: Number, descent :: Number, fontSize :: Number }

getTextMetrics :: PhaserText -> Effect PhaserTextMetrics
getTextMetrics = _return0 "getTextMetrics"

setColor :: String -> PhaserText -> Effect PhaserText
setColor = method1 "setColor(v1)"

setFontFamily :: String -> PhaserText -> Effect PhaserText
setFontFamily = method1 "setFontFamily(v1)"

setFont :: String -> PhaserText -> Effect PhaserText
setFont = method1 "setFont(v1)"

setFontSize :: Number -> PhaserText -> Effect PhaserText
setFontSize = method1 "setFontSize(v1)"

setFontStyle :: String -> PhaserText -> Effect PhaserText
setFontStyle = method1 "setFontStyle(v1)"

setLineSpacing :: Number -> PhaserText -> Effect PhaserText
setLineSpacing = method1 "setLineSpacing(v1)"

setMaxLines :: Number -> PhaserText -> Effect PhaserText
setMaxLines = method1 "setMaxLines(v1)"

type SetPaddingConfig
  = { left :: Number, top :: Number, right :: Number, bottom :: Number }

setPadding :: SetPaddingConfig -> PhaserText -> Effect PhaserText
setPadding = method1 "setPadding(v1.left,v1.top,v1.right,v1.bottom)"

setShadowBlur :: Number -> PhaserText -> Effect PhaserText
setShadowBlur = method1 "setShadowBlur(v1)"

setShadowColor :: String -> PhaserText -> Effect PhaserText
setShadowColor = method1 "setShadowColor(v1)"

setShadowFill :: String -> PhaserText -> Effect PhaserText
setShadowFill = method1 "setShadowFill(v1)"

-- | Position, Color, Blur, shadowStroke, shadowFill
setShadow :: Vector -> String -> Number -> Boolean -> Boolean -> PhaserText -> Effect PhaserText
setShadow = method5 "setShadow(v1.x,v1.y,v2,v3,v4)"

setShadowOffset :: Vector -> PhaserText -> Effect PhaserText
setShadowOffset = method1 "setShadowOffset(v1.x,v1.y)"

setShadowStroke :: Boolean -> PhaserText -> Effect PhaserText
setShadowStroke = method1 "setShadowStroke(v1)"

-- | Color, Thickness
setStroke :: String -> Number -> PhaserText -> Effect PhaserText
setStroke = method2 "setStroke(v1,v2)"

type SetStyleConfig
  = { fontSize :: String
    , fontFamily :: String
    , color :: String
    , align :: String
    , backgroundColor :: String
    }

setStyle :: SetStyleConfig -> PhaserText -> Effect PhaserText
setStyle = method1 "setStyle(v1)"

updateText :: PhaserText -> Effect PhaserText
updateText = _method0 "updateText"
