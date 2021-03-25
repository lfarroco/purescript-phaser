module Graphics.Phaser.Events
  ( createEmitter
  , createListener
  , PhaserEmitter
  , Listener
  ) where

import Prelude
import Effect (Effect)

foreign import data PhaserEmitter :: Type

-- Phaser's API gives us lots of freedom when firing events - this is one way to 
-- type check if the event being fired is valid
-- You still need to provide an unique name for the event
data Listener arg
  = Listener PhaserEmitter String (arg -> Effect Unit)

foreign import createEmitter :: Unit -> Effect PhaserEmitter

foreign import on :: forall arg. String -> (arg -> Effect Unit) -> PhaserEmitter -> Effect (Unit)

-- Returns a function that will run the callback with the emitter 
createListener :: forall arg. String -> (arg -> Effect Unit) -> PhaserEmitter -> Effect (arg -> Effect Unit)
createListener key fn emitter = do
  on key fn emitter
  pure $ \arg_ -> emit_ key arg_ emitter

foreign import emit_ :: forall arg. String -> arg -> PhaserEmitter -> Effect Unit
