module Graphics.Phaser.Events
  ( Listener
  , createEmitter
  , on
  , once
  , off
  , createListener
  , createSceneListener
  , emitSceneEvent
  , emit
  , destroyEmitter
  ) where

import Prelude
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, runEffectFn1, runEffectFn2, runEffectFn3)
import Graphics.Phaser.ForeignTypes (PhaserEmitter, PhaserScene)

-- TODO: accept scene and gameobjects as emitters
-- | Phaser's API gives us lots of freedom when firing events - this is one way
-- | to type check if the event is being fired with valid arguments.
-- | You still need to take care when choosing the event name, as it needs to
-- | be unique.
data Listener arg
  = Listener PhaserEmitter String (arg -> Effect Unit)

foreign import createEmitterImpl :: EffectFn1 Unit PhaserEmitter

-- | Creates a new emitter, that will keep and run its own events.
-- | Consider using a scene emitter, as it will be removed when the scene
-- | is destroyed.
createEmitter :: Unit -> Effect PhaserEmitter
createEmitter = runEffectFn1 createEmitterImpl

foreign import onImpl :: forall arg. EffectFn3 String (arg -> Effect Unit) PhaserEmitter Unit

on :: forall arg. String -> (arg -> Effect Unit) -> PhaserEmitter -> Effect Unit
on = runEffectFn3 onImpl

foreign import onceImpl :: forall arg. EffectFn3 String (arg -> Effect Unit) PhaserEmitter Unit

once :: forall arg. String -> (arg -> Effect Unit) -> PhaserEmitter -> Effect Unit
once = runEffectFn3 onceImpl

foreign import offImpl :: EffectFn2 String PhaserEmitter Unit

off :: String -> PhaserEmitter -> Effect Unit
off = runEffectFn2 offImpl

-- | Receives an event id, a callback and a emitter. Returns a function that
-- | provides its argument to the emitter.
createListener :: forall arg. String -> (arg -> Effect Unit) -> PhaserEmitter -> Effect (arg -> Effect Unit)
createListener key fn emitter = do
  on key fn emitter
  pure $ \arg_ -> emit key arg_ emitter

foreign import createSceneListenerImpl :: forall arg. EffectFn3 String (arg -> Effect Unit) PhaserScene Unit

-- createSceneListenerImpl key fn scene
-- pure $ \arg -> emitSceneEvent key arg scene
createSceneListener :: forall args. String -> (args -> Effect Unit) -> PhaserScene -> Effect Unit
createSceneListener = runEffectFn3 createSceneListenerImpl

foreign import emitSceneEventImpl :: forall arg. EffectFn3 String arg PhaserScene Unit

emitSceneEvent :: forall args. String -> args -> PhaserScene -> Effect Unit
emitSceneEvent = runEffectFn3 emitSceneEventImpl

foreign import emitImpl :: forall arg. EffectFn3 String arg PhaserEmitter Unit

emit :: forall args. String -> args -> PhaserEmitter -> Effect Unit
emit = runEffectFn3 emitImpl

foreign import destroyEmitterImpl :: EffectFn1 PhaserEmitter Unit

destroyEmitter :: PhaserEmitter -> Effect Unit
destroyEmitter = runEffectFn1 destroyEmitterImpl
