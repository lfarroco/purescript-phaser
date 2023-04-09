module Graphics.Phaser.Events.EventEmitter
  ( newEventEmitter
  , addListener
  , destroy
  , emit
  , eventNames
  , listenerCount
  , listeners
  , off
  , on
  , once
  , removeAllListeners
  , removeListener
  , shutdown
  ) where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1, EffectFn2, runEffectFn2, EffectFn3, runEffectFn3)
import Graphics.Phaser.CoreTypes (EventListener)
import Graphics.Phaser.Types (EventEmitterInstance, class EventEmitter)

foreign import newEventEmitterImpl :: EffectFn1 String EventEmitterInstance

newEventEmitter :: String -> Effect EventEmitterInstance
newEventEmitter = runEffectFn1 newEventEmitterImpl

foreign import addListenerImpl :: forall eventemitter. EffectFn3 String EventListener eventemitter eventemitter

addListener :: forall eventemitter. EventEmitter eventemitter => String -> EventListener -> eventemitter -> Effect eventemitter
addListener = runEffectFn3 addListenerImpl

foreign import destroyImpl :: forall eventemitter. EffectFn1 eventemitter Unit

destroy :: forall eventemitter. EventEmitter eventemitter => eventemitter -> Effect Unit
destroy = runEffectFn1 destroyImpl

foreign import emitImpl :: forall eventemitter. EffectFn2 String eventemitter Boolean

emit :: forall eventemitter. EventEmitter eventemitter => String -> eventemitter -> Effect Boolean
emit = runEffectFn2 emitImpl

foreign import eventNamesImpl :: forall eventemitter. EffectFn1 eventemitter (Array String)

eventNames :: forall eventemitter. EventEmitter eventemitter => eventemitter -> Effect (Array String)
eventNames = runEffectFn1 eventNamesImpl

foreign import listenerCountImpl :: forall eventemitter. EffectFn2 String eventemitter Int

listenerCount :: forall eventemitter. EventEmitter eventemitter => String -> eventemitter -> Effect Int
listenerCount = runEffectFn2 listenerCountImpl

foreign import listenersImpl :: forall eventemitter. EffectFn2 String eventemitter (Array EventListener)

listeners :: forall eventemitter. EventEmitter eventemitter => String -> eventemitter -> Effect (Array EventListener)
listeners = runEffectFn2 listenersImpl

foreign import offImpl :: forall eventemitter. EffectFn2 String eventemitter eventemitter

off :: forall eventemitter. EventEmitter eventemitter => String -> eventemitter -> Effect eventemitter
off = runEffectFn2 offImpl

foreign import onImpl :: forall eventemitter. EffectFn3 String EventListener eventemitter eventemitter

on :: forall eventemitter. EventEmitter eventemitter => String -> EventListener -> eventemitter -> Effect eventemitter
on = runEffectFn3 onImpl

foreign import onceImpl :: forall eventemitter. EffectFn3 String EventListener eventemitter eventemitter

once :: forall eventemitter. EventEmitter eventemitter => String -> EventListener -> eventemitter -> Effect eventemitter
once = runEffectFn3 onceImpl

foreign import removeAllListenersImpl :: forall eventemitter. EffectFn1 eventemitter eventemitter

removeAllListeners :: forall eventemitter. EventEmitter eventemitter => eventemitter -> Effect eventemitter
removeAllListeners = runEffectFn1 removeAllListenersImpl

foreign import removeListenerImpl :: forall eventemitter. EffectFn2 String eventemitter eventemitter

removeListener :: forall eventemitter. EventEmitter eventemitter => String -> eventemitter -> Effect eventemitter
removeListener = runEffectFn2 removeListenerImpl

foreign import shutdownImpl :: forall eventemitter. EffectFn1 eventemitter Unit

shutdown :: forall eventemitter. EventEmitter eventemitter => eventemitter -> Effect Unit
shutdown = runEffectFn1 shutdownImpl

