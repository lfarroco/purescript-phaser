module Utils.FFI where

import Prelude
import Effect (Effect)
import Data.Foreign.EasyFFI as FFI

-- FFI Helprs

return0 :: forall obj returnValue. String -> obj -> Effect returnValue
return0 expr obj  = do
  FFI.unsafeForeignFunction ["obj", ""] ("obj." <> expr ) obj

method0  :: forall obj.  String -> obj -> Effect obj
method0 expr obj  = do
  _ <- return0 expr obj
  pure obj

return1 :: forall obj v1 returnValue. String -> v1 -> obj -> Effect returnValue
return1 expr v1 obj  = do
  FFI.unsafeForeignFunction ["v1", "obj", ""] ("obj." <> expr) v1 obj

method1  :: forall obj value.  String -> value -> obj -> Effect obj
method1 expr value obj  = do
  _ <- return1 expr value obj
  pure obj

return2 :: forall obj v1 v2 returnValue. String -> v1 -> v2 -> obj -> Effect returnValue
return2 expr v1 v2 obj  = do
  FFI.unsafeForeignFunction ["v1", "v2", "obj", ""] ("obj." <> expr) v1 v2 obj

method2  :: forall obj v1 v2.  String -> v1 -> v2 -> obj -> Effect obj
method2 expr v1 v2 obj  = do
  _ <- return2 expr v1 v2 obj
  pure obj

return3 :: forall obj v1 v2 v3 returnValue. String -> v1 -> v2 -> v3 -> obj -> Effect returnValue
return3 expr v1 v2 v3 obj  = do
  FFI.unsafeForeignFunction ["v1", "v2", "v3", "obj", ""] ("obj." <> expr) v1 v2 v3 obj

method3  :: forall obj v1 v2 v3.  String -> v1 -> v2 -> v3 -> obj -> Effect obj
method3 expr v1 v2 v3 obj  = do
  _ <- return3 expr v1 v2 v3 obj
  pure obj

return4 :: forall obj v1 v2 v3 v4 returnValue. String -> v1 -> v2 -> v3 -> v4 -> obj -> Effect returnValue
return4 expr v1 v2 v3 v4 obj  = do
  FFI.unsafeForeignFunction ["v1", "v2", "v3", "v4", "obj", ""] ("obj." <> expr) v1 v2 v3 v4 obj

method4  :: forall obj v1 v2 v3 v4.  String -> v1 -> v2 -> v3 -> v4 -> obj -> Effect obj
method4 expr v1 v2 v3 v4 obj  = do
  _ <- return4 expr v1 v2 v3 v4 obj
  pure obj

-- | Get a property directly (as in `variable["name"]`)
get :: forall obj returnValue. String -> obj -> Effect returnValue
get name obj = FFI.unsafeForeignFunction ["obj", ""] ("obj." <> name) obj

