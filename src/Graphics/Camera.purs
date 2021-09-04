module Graphics.Phaser.Camera
  ( setMainCameraBounds
  , getMainCamera
  , createSmoothedKeyControl
  , updateCameraControlDelta
  ) where

import Effect.Uncurried (EffectFn1, EffectFn3, runEffectFn1, runEffectFn3)
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserCamera, PhaserCameraController, PhaserScene)

foreign import setMainCameraBoundsImpl ::
  EffectFn1
    { scene :: PhaserScene
    , x :: Number
    , y :: Number
    , width :: Number
    , height :: Number
    }
    PhaserScene

setMainCameraBounds ::
  { scene :: PhaserScene
  , x :: Number
  , y :: Number
  , width :: Number
  , height :: Number
  } ->
  Effect PhaserScene
setMainCameraBounds = runEffectFn1 setMainCameraBoundsImpl

foreign import getMainCameraImpl :: EffectFn1 PhaserScene PhaserCamera

getMainCamera :: PhaserScene -> Effect PhaserCamera
getMainCamera = runEffectFn1 getMainCameraImpl

type KeyControlConfig
  = { camera :: PhaserCamera
    , left :: String
    , right :: String
    , up :: String
    , down :: String
    , acceleration :: Number
    , drag :: Number
    , maxSpeed :: Number
    }

foreign import createSmoothedKeyControlImpl :: EffectFn1 KeyControlConfig PhaserCameraController

createSmoothedKeyControl :: KeyControlConfig -> Effect PhaserCameraController
createSmoothedKeyControl = runEffectFn1 createSmoothedKeyControlImpl

foreign import updateCameraControlDeltaImpl :: EffectFn3 Number Number PhaserCameraController PhaserCameraController

updateCameraControlDelta :: Number -> Number -> PhaserCameraController -> Effect PhaserCameraController
updateCameraControlDelta = runEffectFn3 updateCameraControlDeltaImpl
