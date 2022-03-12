module Utils.FFI where

import Prelude
import Data.Array ((..))
import Data.Foreign.EasyFFI as FFI
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)

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
          # map (\_ -> "v" <> show n)
  in
    values <> [ "obj", "" ]

-- | FFI Helpers
-- | returnN functions receive a given object and run one of its methods,
-- | providing N arguments to it, and return the value to the caller, wrapped
-- | in an Effect.
-- | eg. a call like"method1 "setName(v1)" is compiled to a function like
-- | "name=>obj=>()=>obj.setName(v1)"
return0 :: forall obj returnValue. String -> obj -> Effect returnValue
return0 expr obj = do
  FFI.unsafeForeignFunction (argsN 0) ("obj." <> expr) obj

-- | methodN function are called in the same way as returnN, but it returns the
-- | provided object back.
method0 :: forall obj. String -> obj -> Effect obj
method0 expr obj = do
  void $ return0 expr obj
  pure obj

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

get :: forall obj returnValue. String -> obj -> returnValue
get name obj = FFI.unsafeForeignFunction [ "obj", "" ] ("obj." <> name) obj

getNullable :: forall a obj. String -> obj -> Effect (Nullable a)
getNullable obj = return1 "children.getByName(v1)" obj

safeGet :: forall obj a. String -> obj -> Effect (Maybe a)
safeGet k s = do
  v <- getNullable k s
  pure $ toMaybe v
