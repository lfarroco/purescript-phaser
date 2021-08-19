module Graphics.Phaser.Camera where

import Data.Function.Uncurried (Fn3, runFn3)
import Effect (Effect)
import Phaser.Graphics.ForeignTypes (PhaserCamera, PhaserCameraController, PhaserScene)

foreign import setMainCameraBounds ::
  { scene :: PhaserScene
  , x :: Number
  , y :: Number
  , width :: Number
  , height :: Number
  } ->
  Effect PhaserScene

foreign import getMainCamera :: PhaserScene -> Effect PhaserCamera

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

foreign import createSmoothedKeyControlImpl :: KeyControlConfig -> Effect PhaserCameraController

foreign import updateCameraControlDeltaImpl :: Fn3 Number Number PhaserCameraController (Effect PhaserCameraController)

updateCameraControlDelta :: Number -> Number -> PhaserCameraController -> Effect PhaserCameraController
updateCameraControlDelta = runFn3 updateCameraControlDeltaImpl
