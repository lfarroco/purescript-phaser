module Utils.FFI where

import Prelude
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, EffectFn4, EffectFn5, EffectFn6, EffectFn7, EffectFn8, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4, runEffectFn5, runEffectFn6, runEffectFn7, runEffectFn8)
import Graphics.Phaser.CoreTypes (EventListener)
import Graphics.Phaser.ForeignTypes (PhaserMainNamespace)

foreign import phaser :: Effect PhaserMainNamespace

foreign import __new0 :: forall fn returnValue. EffectFn1 fn returnValue

_new0 :: forall fn returnValue. fn -> Effect returnValue
_new0 = runEffectFn1 __new0

foreign import __new1 :: forall fn v1 returnValue. EffectFn2 fn v1 returnValue

_new1 :: forall fn v1 returnValue. fn -> v1 -> Effect returnValue
_new1 = runEffectFn2 __new1

foreign import __new2 :: forall fn v1 v2 returnValue. EffectFn3 fn v1 v2 returnValue

_new2 :: forall fn v1 v2 returnValue. fn -> v1 -> v2 -> Effect returnValue
_new2 = runEffectFn3 __new2

foreign import __new3 :: forall fn v1 v2 v3 returnValue. EffectFn4 fn v1 v2 v3 returnValue

_new3 :: forall fn v1 v2 v3 returnValue. fn -> v1 -> v2 -> v3 -> Effect returnValue
_new3 = runEffectFn4 __new3

foreign import __new4 :: forall fn v1 v2 v3 v4 returnValue. EffectFn5 fn v1 v2 v3 v4 returnValue

_new4 :: forall fn v1 v2 v3 v4 returnValue. fn -> v1 -> v2 -> v3 -> v4 -> Effect returnValue
_new4 = runEffectFn5 __new4

foreign import __getProp :: forall a b. EffectFn2 String a b

_getProp :: forall obj returnValue. String -> obj -> Effect returnValue
_getProp = runEffectFn2 __getProp

foreign import __return0 :: forall a b. EffectFn2 String a b

_return0 :: forall obj returnValue. String -> obj -> Effect returnValue
_return0 = runEffectFn2 __return0

foreign import __return1 :: forall a b c. EffectFn3 String a b c

_return1 :: forall obj v1 returnValue. String -> v1 -> obj -> Effect returnValue
_return1 = runEffectFn3 __return1

foreign import __return2 :: forall a b c d. EffectFn4 String a b c d

_return2 :: forall obj v1 v2 returnValue. String -> v1 -> v2 -> obj -> Effect returnValue
_return2 = runEffectFn4 __return2

foreign import __return3 :: forall a b c d e. EffectFn5 String a b c d e

_return3 :: forall obj v1 v2 v3 returnValue. String -> v1 -> v2 -> v3 -> obj -> Effect returnValue
_return3 = runEffectFn5 __return3

foreign import __return4 :: forall a b c d e f. EffectFn6 String a b c d e f

_return4 :: forall obj v1 v2 v3 v4 returnValue. String -> v1 -> v2 -> v3 -> v4 -> obj -> Effect returnValue
_return4 = runEffectFn6 __return4

foreign import __return5 :: forall a b c d e f g h. EffectFn7 a b c d e f g h

_return5 :: forall prop obj v1 v2 v3 v4 v5 returnValue. prop -> v1 -> v2 -> v3 -> v4 -> v5 -> obj -> Effect returnValue
_return5 = runEffectFn7 __return5

foreign import __return6 :: forall a b c d e f g h i. EffectFn8 a b c d e f g h i

_return6 :: forall prop obj v1 v2 v3 v4 v5 v6 returnValue. prop -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> obj -> Effect returnValue
_return6 = runEffectFn8 __return6

_method0 :: forall obj. String -> obj -> Effect obj
_method0 prop obj = do
  void $ _return0 prop obj
  pure obj

_method1 :: forall obj v1. String -> v1 -> obj -> Effect obj
_method1 prop v1 obj = do
  void $ _return1 prop v1 obj
  pure obj

_method2 :: forall obj v1 v2. String -> v1 -> v2 -> obj -> Effect obj
_method2 prop v1 v2 obj = do
  void $ _return2 prop v1 v2 obj
  pure obj

_method3 :: forall obj v1 v2 v3. String -> v1 -> v2 -> v3 -> obj -> Effect obj
_method3 prop v1 v2 v3 obj = do
  void $ _return3 prop v1 v2 v3 obj
  pure obj

_method4 :: forall obj v1 v2 v3 v4. String -> v1 -> v2 -> v3 -> v4 -> obj -> Effect obj
_method4 prop v1 v2 v3 v4 obj = do
  void $ _return4 prop v1 v2 v3 v4 obj
  pure obj

_method5 :: forall obj v1 v2 v3 v4 v5. String -> v1 -> v2 -> v3 -> v4 -> v5 -> obj -> Effect obj
_method5 prop v1 v2 v3 v4 v5 obj = do
  void $ _return5 prop v1 v2 v3 v4 v5 obj
  pure obj

foreign import __setProp :: forall val obj. EffectFn3 String val obj obj

_setProp :: forall val obj. String -> val -> obj -> Effect obj
_setProp = runEffectFn3 __setProp

getNullable :: forall a obj. String -> String -> obj -> Effect (Nullable a)
getNullable expr obj = _return1 expr obj

safeGet :: forall obj a. String -> obj -> Effect (Maybe a)
safeGet k obj =
  _getProp "children" obj >>= getNullable "getByName" k
    >>= (toMaybe >>> pure)

maybeProp :: forall obj a. String -> obj -> Effect (Maybe a)
maybeProp k obj = do
  (v :: Nullable a) <- _getProp k obj
  pure $ toMaybe v

foreign import _listener0 :: Effect Unit -> EventListener

foreign import _listener1 :: forall a. (a -> Effect Unit) -> EventListener

foreign import _listener2 :: forall a b. (a -> b -> Effect Unit) -> EventListener

foreign import _listener3 :: forall a b c. (a -> b -> c -> Effect Unit) -> EventListener

foreign import _listener4 :: forall a b c d. (a -> b -> c -> d -> Effect Unit) -> EventListener

foreign import _listener5 :: forall a b c d e. (a -> b -> c -> d -> e -> Effect Unit) -> EventListener
