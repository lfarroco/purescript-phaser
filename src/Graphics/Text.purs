module Graphics.Phaser.Text (create, TextConfig) where

import Data.Function.Uncurried (Fn2, runFn2)
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserScene, PhaserText)

type TextConfig
  = { pos :: { x :: Number, y :: Number }
    , text :: String
    , config :: { color :: String, fontSize :: Int, fontFamily :: String }
    }

foreign import createImpl :: Fn2 TextConfig PhaserScene (Effect PhaserText)

create :: TextConfig -> PhaserScene -> Effect PhaserText
create = runFn2 createImpl
