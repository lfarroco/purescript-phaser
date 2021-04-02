module Graphics.Phaser.Text where

import Effect (Effect)
import Phaser.Graphics.ForeignTypes (PhaserScene, PhaserText)


foreign import create ::
  { scene :: PhaserScene
  , pos :: { x :: Number, y :: Number }
  , text :: String
  , config :: { color :: String, fontSize :: Int, fontFamily :: String }
  } ->
  Effect PhaserText

  
