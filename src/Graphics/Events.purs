module Graphics.Phaser.Events where

import Prelude

import Effect (Effect)
import Graphics.Phaser.ForeignTypes (NodeEventEmitter, PhaserContainer, PhaserGraphic, PhaserImage, PhaserSprite)
import Phaser.Graphics.ArcadePhysics (ArcadeImage)
import Utils.FFI (method0, method1, method2)

class EventEmitter :: forall k. k -> Constraint
class EventEmitter a

instance EventEmitter NodeEventEmitter
instance EventEmitter PhaserImage
instance EventEmitter PhaserContainer
instance EventEmitter PhaserGraphic
instance EventEmitter PhaserSprite
instance EventEmitter ArcadeImage

-- | The listener should be an Effect (not a->Effect) because we need to have
-- | the same exact function when removing the listener
on :: forall emitter. EventEmitter emitter => String -> Effect Unit -> emitter -> Effect emitter
on = method2 "on(v1,v2)"

once :: forall emitter args. String -> (args -> Effect Unit) -> emitter -> Effect emitter
once = method2 "once(v1,v2)"

emit :: forall emitter args.EventEmitter emitter=> String -> args -> emitter -> Effect emitter
emit = method2 "emit(v1,v2)"

off:: forall emitter. String -> emitter -> Effect emitter
off= method1 "off(v1)"

removeListener :: forall emitter. EventEmitter emitter => String ->  Effect Unit -> emitter -> Effect emitter
removeListener = method2 "removeListener(v1,v2)"

removeAllListeners :: forall emitter. EventEmitter emitter=>  emitter -> Effect emitter
removeAllListeners = method0 "removeAllListeners()"
