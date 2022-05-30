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
import Utils.FFI (_getProp, _method)

setMainCameraBounds :: Vector -> Dimensions -> PhaserScene -> Effect PhaserScene
setMainCameraBounds { x, y } { width, height } =
  _getProp "cameras"
    >=> _getProp "main"
    >=> _method "setBounds" [ x, y, width, height ]

getMainCamera :: PhaserScene -> Effect PhaserCamera
getMainCamera = _getProp "cameras" >=> _method "main" []

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
updateCameraControlDelta delta = _method "update" [ delta ]
