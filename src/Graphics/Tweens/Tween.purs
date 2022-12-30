module Graphics.Phaser.Tween where

import Prelude
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserScene, PhaserTween)
import Utils.FFI (_method0)

data TweenProperty
  = TweenVector { x :: Number, y :: Number }
  | TweenScale { scaleX :: Number, scaleY :: Number }
  | TweenRotation { rotation :: Number }
  | TweenAngle { angle :: Number }
  | TweenAlpha { alpha :: Number }

addTween ::
  forall target.
  { scene :: PhaserScene
  , targets :: Array target
  , prop :: TweenProperty
  , delay :: Int
  , duration :: Number
  , ease :: String
  , repeat :: Int
  , yoyo :: Boolean
  , callback :: PhaserScene -> Effect Unit
  } ->
  Effect PhaserTween
addTween config = case config.prop of
  TweenVector v -> addTweenImpl $ config { prop = v }
  TweenScale v -> addTweenImpl $ config { prop = v }
  TweenRotation v -> addTweenImpl $ config { prop = v }
  TweenAngle v -> addTweenImpl $ config { prop = v }
  TweenAlpha v -> addTweenImpl $ config { prop = v }

foreign import addTweenImpl ::
  forall target prop.
  { scene :: PhaserScene
  , targets :: Array target
  , prop :: prop
  , delay :: Int
  , duration :: Number
  , ease :: String
  , repeat :: Int
  , yoyo :: Boolean
  , callback :: PhaserScene -> Effect Unit
  } ->
  Effect PhaserTween

stop :: PhaserTween -> Effect PhaserTween
stop tween = _method0 "stop" tween

remove :: PhaserTween -> Effect PhaserTween
remove tween = _method0 "remove" tween

pause :: PhaserTween -> Effect PhaserTween
pause tween = _method0 "pause" tween
