module Graphics.Phaser.Time where

import Prelude

import Effect.Aff (Aff)
import Effect.Aff.Compat (EffectFnAff, fromEffectFnAff)
import Phaser.Graphics.ForeignTypes (PhaserScene)

foreign import delay_ :: PhaserScene -> Int -> EffectFnAff Unit

delay :: PhaserScene -> Int -> Aff Unit
delay a = fromEffectFnAff <<< delay_ a
