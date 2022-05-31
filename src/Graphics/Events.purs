module Graphics.Phaser.Events where

import Prelude
import Effect (Effect)
import Graphics.Phaser.CoreTypes (class EventEmitter, class HasNodeEventEmitter, EventListener)
import Graphics.Phaser.ForeignTypes (NodeEventEmitter)
import Utils.FFI (_getProp, _listener0, _listener1, _listener2, _listener3, _listener4, _listener5, _method0, _method1, _method2)

-- consider this to turn any argN fn into an event listener
-- https://github.com/bklaric/purescript-idiomatic-node-events/blob/master/src/Node/Events/EventListener.js#L3
createEventListener0 :: Effect Unit -> EventListener
createEventListener0 = _listener0

createEventListener1 :: forall a. (a -> Effect Unit) -> EventListener
createEventListener1 = _listener1

createEventListener2 :: forall a b. (a -> b -> Effect Unit) -> EventListener
createEventListener2 = _listener2

createEventListener3 :: forall a b c. (a -> b -> c -> Effect Unit) -> EventListener
createEventListener3 = _listener3

createEventListener4 :: forall a b c d. (a -> b -> c -> d -> Effect Unit) -> EventListener
createEventListener4 = _listener4

createEventListener5 :: forall a b c d e. (a -> b -> c -> d -> e -> Effect Unit) -> EventListener
createEventListener5 = _listener5

on :: forall emitter. EventEmitter emitter => String -> EventListener -> emitter -> Effect emitter
on = _method2 "on"

once :: forall emitter. EventEmitter emitter => String -> EventListener -> emitter -> Effect emitter
once = _method2 "once"

emit :: forall emitter args. EventEmitter emitter => String -> args -> emitter -> Effect emitter
emit = _method2 "emit"

off :: forall emitter. String -> emitter -> Effect emitter
off = _method1 "off"

-- If you want to create a listener that removes itself, you will need to use a reference
-- https://stackoverflow.com/a/57276021/2467235
removeListener :: forall emitter. EventEmitter emitter => String -> EventListener -> emitter -> Effect emitter
removeListener = _method2 "removeListener"

removeAllListeners :: forall emitter. EventEmitter emitter => emitter -> Effect emitter
removeAllListeners = _method0 "removeAllListeners"

shutdown :: forall emitter. EventEmitter emitter => emitter -> Effect emitter
shutdown = _method0 "shutdown"

getEventEmitter :: forall a. HasNodeEventEmitter a => a -> Effect NodeEventEmitter
getEventEmitter = _getProp "events"
