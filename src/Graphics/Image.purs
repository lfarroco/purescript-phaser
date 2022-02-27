module Graphics.Phaser.Image (create) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Type.Row (type (+))


-- | Create a new image in the given scene
--foreign import createImpl :: EffectFn2 String Scene Image

create :: Scene a => String -> a -> Effect Image b
create = runEffectFn2 createImpl




