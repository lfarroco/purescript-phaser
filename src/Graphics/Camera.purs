module Graphics.Phaser.Camera
  ( setMainCameraBounds
  , getMainCamera
  , createSmoothedKeyControl
  , updateCameraControlDelta
  ) where

import Prelude
import Data.Foreign.EasyFFI as FFI
import Effect (Effect)
import Graphics.Phaser.CoreTypes (Vector, Dimensions)
import Graphics.Phaser.ForeignTypes (PhaserCamera, PhaserCameraController, PhaserScene)
import Utils.FFI (_getProp, _method1, _return0, _return4)

setMainCameraBounds :: Vector -> Dimensions -> PhaserScene -> Effect PhaserScene
setMainCameraBounds { x, y } { width, height } scn =
  _getProp "cameras" scn
    >>= _getProp "main"
    >>= _return4 "setBounds" x y width height
    >>= const (pure scn)

getMainCamera :: PhaserScene -> Effect PhaserCamera
getMainCamera = _return0 "cameras.main"

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
createSmoothedKeyControl = FFI.unsafeForeignFunction [ "config", "" ] "new Phaser.Cameras.Controls.FixedKeyControl(config)"

updateCameraControlDelta :: Number -> PhaserCameraController -> Effect PhaserCameraController
updateCameraControlDelta = _method1 "update"
