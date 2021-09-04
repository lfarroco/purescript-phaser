module Graphics.Phaser.Time (delay) where

import Prelude
import Effect.Aff (Aff)
import Effect.Aff.Compat (EffectFnAff, fromEffectFnAff)
import Graphics.Phaser.ForeignTypes (PhaserScene)

foreign import delay_ :: PhaserScene -> Int -> EffectFnAff Unit

-- | Example usage: Destroy a container after 1s
-- | destroyContainer :: PhaserScene -> PhaserContainer -> Effect Unit
-- | destroyContainer scene cont =
-- |   launchAff_ do
-- |     delay scene 1000
-- |     liftEffect $ do
-- |         destroy cont
delay :: PhaserScene -> Int -> Aff Unit
delay a = fromEffectFnAff <<< delay_ a
