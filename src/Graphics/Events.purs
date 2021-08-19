module Graphics.Phaser.Events where

import Prelude
import Effect (Effect)
import Phaser.Graphics.ForeignTypes (PhaserEmitter, PhaserScene)

-- | Phaser's API gives us lots of freedom when firing events - this is one way
-- | to type check if the event being fired with valid arguments.
-- | You still need to take care when choosing the event name, as it needs to
-- | be unique.
data Listener arg
  = Listener PhaserEmitter String (arg -> Effect Unit)

-- | Creates a new emitter, that will keep and run its own events.
-- | Consider using a scene emitter, as it will be removed when the scene
-- | is destroyed.
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
  pure $ \arg_ -> emit key arg_ emitter

foreign import createSceneListener_ :: forall arg. String -> (arg -> Effect Unit) -> PhaserScene -> Effect Unit

createSceneListener :: forall arg. String -> (arg -> Effect Unit) -> PhaserScene -> Effect (arg -> Effect Unit)
createSceneListener key fn scene = do
  createSceneListener_ key fn scene
  pure $ \arg -> emitSceneEvent key arg scene

foreign import emitSceneEvent :: forall arg. String -> arg -> PhaserScene -> Effect Unit

foreign import emit :: forall arg. String -> arg -> PhaserEmitter -> Effect Unit

foreign import destroyEmitter :: PhaserEmitter -> Effect Unit
