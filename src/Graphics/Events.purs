module Graphics.Phaser.Events where

import Prelude
import Data.Foreign.EasyFFI (unsafeForeignFunction)
import Effect (Effect)
import Graphics.Phaser.CoreTypes (class EventEmitter, class HasNodeEventEmitter, EventListener)
import Graphics.Phaser.ForeignTypes (NodeEventEmitter)
import Utils.FFI (_getProp, _method0, method1, method2)

-- consider this to turn any argN fn into an event listener
-- https://github.com/bklaric/purescript-idiomatic-node-events/blob/master/src/Node/Events/EventListener.js#L3
createEventListener0 :: Effect Unit -> EventListener
createEventListener0 = unsafeForeignFunction [ "fn" ] "arg=>fn()"

createEventListener1 :: forall a. (a -> Effect Unit) -> EventListener
createEventListener1 = unsafeForeignFunction [ "fn" ] "arg=>fn(arg)()"

createEventListener2 :: forall a b. (a -> b -> Effect Unit) -> EventListener
createEventListener2 = unsafeForeignFunction [ "fn" ] "(arg1,arg2)=>fn(arg1)(arg2)()"

createEventListener3 :: forall a b c. (a -> b -> c -> Effect Unit) -> EventListener
createEventListener3 = unsafeForeignFunction [ "fn" ] "(arg1,arg2,arg3)=>fn(arg1)(arg2)(arg3)()"

createEventListener4 :: forall a b c d. (a -> b -> c -> d -> Effect Unit) -> EventListener
createEventListener4 = unsafeForeignFunction [ "fn" ] "(arg1,arg2,arg3,arg4)=>fn(arg1)(arg2)(arg3)(arg4)()"

on :: forall emitter. EventEmitter emitter => String -> EventListener -> emitter -> Effect emitter
on = method2 "on(v1,v2)"

once :: forall emitter. EventEmitter emitter => String -> EventListener -> emitter -> Effect emitter
once = method2 "once(v1,v2)"

emit :: forall emitter args. EventEmitter emitter => String -> args -> emitter -> Effect emitter
emit = method2 "emit(v1,v2)"

off :: forall emitter. String -> emitter -> Effect emitter
off = method1 "off(v1)"

-- If you want to create a listener that removes itself, you will need to use a reference
-- https://stackoverflow.com/a/57276021/2467235
removeListener :: forall emitter. EventEmitter emitter => String -> EventListener -> emitter -> Effect emitter
removeListener = method2 "removeListener(v1,v2)"

removeAllListeners :: forall emitter. EventEmitter emitter => emitter -> Effect emitter
removeAllListeners = _method0 "removeAllListeners"

shutdown :: forall emitter. EventEmitter emitter => emitter -> Effect emitter
shutdown = _method0 "shutdown"

getEventEmitter :: forall a. HasNodeEventEmitter a => a -> Effect NodeEventEmitter
getEventEmitter = _getProp "events"
