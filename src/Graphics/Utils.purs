module Internal.Utils where

import Data.Maybe (Maybe(..))
import Data.Options ((:=), optional, Options, opt)

_opt :: forall a b. String -> a -> Options b
_opt attr val = optional (opt attr) := Just val
