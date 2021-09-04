module Graphics.Phaser.Text (create, TextConfig) where

import Effect.Uncurried (EffectFn2, runEffectFn2)
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserScene, PhaserText)

type TextConfig
  = { pos :: { x :: Number, y :: Number }
    , text :: String
    , config :: { color :: String, fontSize :: Int, fontFamily :: String }
    }

foreign import createImpl :: EffectFn2 TextConfig PhaserScene PhaserText

create :: TextConfig -> PhaserScene -> Effect PhaserText
create = runEffectFn2 createImpl
