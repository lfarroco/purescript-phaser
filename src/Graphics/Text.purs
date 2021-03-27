module Graphics.Phaser.Text where

import Effect (Effect)
import Graphics.Phaser.Scene (PhaserScene)

foreign import data PhaserText :: Type

foreign import text ::
  { scene :: PhaserScene
  , pos :: { x :: Number, y :: Number }
  , text :: String
  , config :: { color :: String, fontSize :: Int, fontFamily :: String }
  } ->
  Effect PhaserText
