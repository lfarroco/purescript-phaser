module Graphics.Phaser.Image (create) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Graphics.Phaser.ForeignTypes (PhaserImage, PhaserScene)

-- | Create a new image in the given scene
foreign import createImpl :: EffectFn2 String PhaserScene PhaserImage

create :: String -> PhaserScene -> Effect PhaserImage
create = runEffectFn2 createImpl
