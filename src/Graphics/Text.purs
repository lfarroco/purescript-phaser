module Graphics.Phaser.Text where

import Data.Function.Uncurried (Fn2, runFn2)
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserScene, PhaserText)

foreign import createImpl ::
  Fn2
    { pos :: { x :: Number, y :: Number }
    , text :: String
    , config :: { color :: String, fontSize :: Int, fontFamily :: String }
    }
    PhaserScene
    (Effect PhaserText)

create ::
  { config ::
      { color :: String
      , fontFamily :: String
      , fontSize :: Int
      }
  , pos :: { x :: Number, y :: Number }
  , text :: String
  } ->
  PhaserScene -> Effect PhaserText
create = runFn2 createImpl
