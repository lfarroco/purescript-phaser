module Graphics.Phaser.Camera
  ( setMainCameraBounds
  , getMainCamera
  , createSmoothedKeyControl
  , updateCameraControlDelta
  ) where

import Data.Foreign.EasyFFI as FFI
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserCamera, PhaserCameraController, PhaserScene)
import Graphics.Phaser.CoreTypes (Vector, Dimensions)
import Utils.FFI (method1, method2, return0)

setMainCameraBounds :: Vector -> Dimensions -> PhaserScene -> Effect PhaserScene
setMainCameraBounds = method2 "cameras.main.setBounds(v1.x,v1.y,v2.width,v2.height)"

getMainCamera :: PhaserScene -> Effect PhaserCamera
getMainCamera = return0 "cameras.main"

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

createSmoothedKeyControl :: KeyControlConfig -> Effect PhaserCameraController
createSmoothedKeyControl = FFI.unsafeForeignFunction ["config", ""] "new Phaser.Cameras.Controls.FixedKeyControl(config)"

updateCameraControlDelta :: Number -> PhaserCameraController -> Effect PhaserCameraController
updateCameraControlDelta = method1 "update(delta)"
