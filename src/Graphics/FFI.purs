module Graphics.Phaser.FFI where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)

foreign import getImpl :: forall a b. EffectFn2 String a b
foreign import setImpl :: forall value entity. EffectFn3 String value entity Unit

get :: forall entity returnValue. String -> entity -> Effect returnValue
get = runEffectFn2 getImpl

set :: forall value entity. String -> value -> entity -> Effect Unit
set = runEffectFn3 setImpl
