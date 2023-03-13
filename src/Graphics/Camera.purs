module Graphics.Phaser.Camera where

import Prelude
import Effect (Effect)
import Graphics.Phaser.CoreTypes (Vector, Dimensions)
import Graphics.Phaser.ForeignTypes (PhaserCamera, PhaserCameraController, PhaserScene)
import Utils.FFI (_getProp, _method1, _new1, _return4, _setProp, phaser)

setBounds :: Vector -> Dimensions -> PhaserCamera -> Effect PhaserCamera
setBounds { x, y } { width, height } = _return4 "setBounds" x y width height

getMainCamera :: PhaserScene -> Effect PhaserCamera
getMainCamera = _getProp "cameras" >=> _getProp "main"

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
createSmoothedKeyControl cfg =
  phaser
    >>= _getProp "Cameras"
    >>= _getProp "Controls"
    >>= _getProp "FixedKeyControl"
    >>= _new1 cfg

updateCameraControlDelta :: Number -> PhaserCameraController -> Effect PhaserCameraController
updateCameraControlDelta = _method1 "update"

scrollX :: PhaserCamera -> Effect Number
scrollX = _getProp "scrollX"

setScrollX :: Number -> PhaserCamera -> Effect PhaserCamera
setScrollX = _setProp "scrollX"

scrollY :: PhaserCamera -> Effect Number
scrollY = _getProp "scrollY"

setScrollY :: Number -> PhaserCamera -> Effect PhaserCamera
setScrollY = _setProp "scrollY"
