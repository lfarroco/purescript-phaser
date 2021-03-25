module Graphics.Phaser.Events
  ( createEmitter
  , createListener
  , destroyEmitter
  , PhaserEmitter
  , Listener
  ) where

import Prelude
import Effect (Effect)

foreign import data PhaserEmitter :: Type

-- | Phaser's API gives us lots of freedom when firing events - this is one way
-- | to type check if the event being fired with valid arguments.
-- | You still need to take care when choosing the event name, as it needs to
-- | be unique.
data Listener arg
  = Listener PhaserEmitter String (arg -> Effect Unit)

-- | Creates a new scene emitter, that will keep and run its own events.
foreign import createEmitter :: Unit -> Effect PhaserEmitter

foreign import on ::
  forall arg.
  String ->
  (arg -> Effect Unit) ->
  PhaserEmitter -> Effect (Unit)

-- | Receives an event id, a callback and a emitter. Returns a function that
-- | provides its argument to the emitter.
createListener :: forall arg. String -> (arg -> Effect Unit) -> PhaserEmitter -> Effect (arg -> Effect Unit)
createListener key fn emitter = do
  on key fn emitter
  pure $ \arg_ -> emit_ key arg_ emitter

foreign import emit_ :: forall arg. String -> arg -> PhaserEmitter -> Effect Unit

foreign import destroyEmitter :: PhaserEmitter -> Effect Unit
