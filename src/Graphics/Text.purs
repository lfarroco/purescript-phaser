module Graphics.Phaser.Text
  ( create
  , setText
  , setColor
  , setFontFamily
  , setFont
  , setFontSize
  , setFontStyle
  , setLineSpacing
  , setMaxLines
  , setPadding
  , setShadowBlur
  , setShadowColor
  , setShadowFill
  , setShadow
  , setShadowOffset
  , setShadowStroke
  , setStroke
  , setStyle
  , updateText
  ) where

-- https://photonstorm.github.io/phaser3-docs/Phaser.GameObjects.Text.html
import Prelude
import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Graphics.Phaser.ForeignTypes (PhaserScene, PhaserText)
import Graphics.Phaser.GameObject (Vector)

type SingleValueEffect a
  = EffectFn2 a PhaserText PhaserText

foreign import createImpl :: EffectFn2 String PhaserScene PhaserText

create :: String -> PhaserScene -> Effect PhaserText
create = runEffectFn2 createImpl

foreign import setTextImpl :: SingleValueEffect String

setText :: String -> PhaserText -> Effect PhaserText
setText = runEffectFn2 setTextImpl

type PhaserTextMetrics
  = { ascent :: Number, descent :: Number, fontSize :: Number }

foreign import getTextMetrics :: PhaserText -> PhaserTextMetrics

foreign import setColorImpl :: SingleValueEffect String

setColor :: String -> PhaserText -> Effect PhaserText
setColor = runEffectFn2 setColorImpl

foreign import setFontFamilyImpl :: SingleValueEffect String

setFontFamily :: String -> PhaserText -> Effect PhaserText
setFontFamily = runEffectFn2 setFontFamilyImpl

foreign import setFontImpl :: SingleValueEffect String

setFont :: String -> PhaserText -> Effect PhaserText
setFont = runEffectFn2 setFontImpl

foreign import setFontSizeImpl :: SingleValueEffect Number

setFontSize :: Number -> PhaserText -> Effect PhaserText
setFontSize = runEffectFn2 setFontSizeImpl

foreign import setFontStyleImpl :: SingleValueEffect String

setFontStyle :: String -> PhaserText -> Effect PhaserText
setFontStyle = runEffectFn2 setFontStyleImpl

foreign import setLineSpacingImpl :: SingleValueEffect Number

setLineSpacing :: Number -> PhaserText -> Effect PhaserText
setLineSpacing = runEffectFn2 setLineSpacingImpl

foreign import setMaxLinesImpl :: SingleValueEffect Number

setMaxLines :: Number -> PhaserText -> Effect PhaserText
setMaxLines = runEffectFn2 setMaxLinesImpl

type SetPaddingConfig
  = { left :: Number, top :: Number, right :: Number, bottom :: Number }

foreign import setPaddingImpl :: SingleValueEffect SetPaddingConfig

setPadding :: SetPaddingConfig -> PhaserText -> Effect PhaserText
setPadding = runEffectFn2 setPaddingImpl

foreign import setShadowBlurImpl :: SingleValueEffect Number

setShadowBlur :: Number -> PhaserText -> Effect PhaserText
setShadowBlur = runEffectFn2 setShadowBlurImpl

foreign import setShadowColorImpl :: SingleValueEffect String

setShadowColor :: String -> PhaserText -> Effect PhaserText
setShadowColor = runEffectFn2 setShadowColorImpl

foreign import setShadowFillImpl :: SingleValueEffect String

setShadowFill :: String -> PhaserText -> Effect PhaserText
setShadowFill = runEffectFn2 setShadowFillImpl

foreign import setShadowImpl :: SingleValueEffect Unit

setShadow :: Unit -> PhaserText -> Effect PhaserText
setShadow = runEffectFn2 setShadowImpl

foreign import setShadowOffsetImpl :: SingleValueEffect Vector

setShadowOffset :: Vector -> PhaserText -> Effect PhaserText
setShadowOffset = runEffectFn2 setShadowOffsetImpl

foreign import setShadowStrokeImpl :: SingleValueEffect Boolean

setShadowStroke :: Boolean -> PhaserText -> Effect PhaserText
setShadowStroke = runEffectFn2 setShadowStrokeImpl

foreign import setStrokeImpl :: EffectFn3 String Number PhaserText PhaserText

-- | Color, thickness, text object
setStroke :: String -> Number -> PhaserText -> Effect PhaserText
setStroke = runEffectFn3 setStrokeImpl

type SetStyleConfig
  = { fontSize :: String
    , fontFamily :: String
    , color :: String
    , align :: String
    , backgroundColor :: String
    }

foreign import setStyleImpl :: SingleValueEffect SetStyleConfig

setStyle :: SetStyleConfig -> PhaserText -> Effect PhaserText
setStyle = runEffectFn2 setStyleImpl

foreign import updateTextImpl :: SingleValueEffect Unit

updateText :: Unit -> PhaserText -> Effect PhaserText
updateText = runEffectFn2 updateTextImpl
