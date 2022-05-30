module Utils.FFI where

import Prelude
import Data.Array ((..))
import Data.Foreign.EasyFFI as FFI
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)

-- | argsN 3 == ["v1", "v2", "v3", "obj", "" ]
-- | argsN 0 == ["obj", "" ]
-- |
argsN :: Int -> Array String
argsN n =
  let
    values =
      if n < 1 then
        []
      else
        1 .. n
          # map (\i -> "v" <> show i)
  in
    values <> [ "obj", "" ]

foreign import __getProp :: forall a b. EffectFn2 String a b

_getProp :: forall obj returnValue. String -> obj -> Effect returnValue
_getProp = runEffectFn2 __getProp

foreign import __runFn :: forall a b c. EffectFn2 a b c

_runFn :: forall fn args returnValue. fn -> args -> Effect returnValue
_runFn = runEffectFn2 __runFn

foreign import __method :: forall a b c d. EffectFn3 a b c d

_method :: forall prop args obj returnValue. prop -> args -> obj -> Effect returnValue
_method = runEffectFn3 __method

return1 :: forall obj v1 returnValue. String -> v1 -> obj -> Effect returnValue
return1 expr v1 obj = do
  FFI.unsafeForeignFunction (argsN 1) ("obj." <> expr) v1 obj

method1 :: forall obj value. String -> value -> obj -> Effect obj
method1 expr value obj = do
  void $ return1 expr value obj
  pure obj

return2 :: forall obj v1 v2 returnValue. String -> v1 -> v2 -> obj -> Effect returnValue
return2 expr v1 v2 obj = do
  FFI.unsafeForeignFunction (argsN 2) ("obj." <> expr) v1 v2 obj

method2 :: forall obj v1 v2. String -> v1 -> v2 -> obj -> Effect obj
method2 expr v1 v2 obj = do
  void $ return2 expr v1 v2 obj
  pure obj

return3 :: forall obj v1 v2 v3 returnValue. String -> v1 -> v2 -> v3 -> obj -> Effect returnValue
return3 expr v1 v2 v3 obj = do
  FFI.unsafeForeignFunction (argsN 3) ("obj." <> expr) v1 v2 v3 obj

method3 :: forall obj v1 v2 v3. String -> v1 -> v2 -> v3 -> obj -> Effect obj
method3 expr v1 v2 v3 obj = do
  void $ return3 expr v1 v2 v3 obj
  pure obj

return4 :: forall obj v1 v2 v3 v4 returnValue. String -> v1 -> v2 -> v3 -> v4 -> obj -> Effect returnValue
return4 expr v1 v2 v3 v4 obj = do
  FFI.unsafeForeignFunction (argsN 4) ("obj." <> expr) v1 v2 v3 v4 obj

method4 :: forall obj v1 v2 v3 v4. String -> v1 -> v2 -> v3 -> v4 -> obj -> Effect obj
method4 expr v1 v2 v3 v4 obj = do
  void $ return4 expr v1 v2 v3 v4 obj
  pure obj

return5 :: forall obj v1 v2 v3 v4 v5 returnValue. String -> v1 -> v2 -> v3 -> v4 -> v5 -> obj -> Effect returnValue
return5 expr v1 v2 v3 v4 v5 obj = do
  FFI.unsafeForeignFunction (argsN 5) ("obj." <> expr) v1 v2 v3 v4 v5 obj

method5 :: forall obj v1 v2 v3 v4 v5. String -> v1 -> v2 -> v3 -> v4 -> v5 -> obj -> Effect obj
method5 expr v1 v2 v3 v4 v5 obj = do
  void $ return5 expr v1 v2 v3 v4 v5 obj
  pure obj

_getProperty :: forall obj returnValue. String -> obj -> Effect returnValue
_getProperty name obj = FFI.unsafeForeignFunction [ "obj", "" ] ("obj." <> name) obj

setProperty :: forall obj value. String -> value -> obj -> Effect Unit
setProperty name value obj = FFI.unsafeForeignFunction [ "v1", "obj", "" ] ("obj." <> name <> " = v1") value obj

getNullable :: forall a obj. String -> String -> obj -> Effect (Nullable a)
getNullable expr obj = return1 expr obj

safeGet :: forall obj a. String -> obj -> Effect (Maybe a)
safeGet k obj = do
  v <- getNullable "children.getByName(v1)" k obj
  pure $ toMaybe v
