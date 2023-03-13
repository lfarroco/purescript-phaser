module Graphics.Phaser.Plugins.Spine where

import Prelude
import Effect (Effect)
import Graphics.Phaser.CoreTypes (Vector)
import Graphics.Phaser.ForeignTypes (PhaserScene, PhaserSpineGameObject)
import Utils.FFI (_getProp, _method1, _method3, _return4, _return5)

loadAssetFromScene ::
  String ->
  String ->
  Array String ->
  Boolean ->
  PhaserScene ->
  Effect PhaserScene
loadAssetFromScene key path atlases preMultipliedAlpha scn =
  _getProp "load" scn
    >>= _return4 "spine" key path atlases preMultipliedAlpha
    >>= const (pure scn)

createSkeletonFromScene :: { position :: Vector, skeletonKey :: String, animation :: String, preMultipliedAlpha :: Boolean } -> PhaserScene -> Effect PhaserSpineGameObject
createSkeletonFromScene { position, skeletonKey, animation, preMultipliedAlpha } =
  _getProp "add"
    >=> _return5 "spine" position.x position.y skeletonKey animation preMultipliedAlpha

play :: String -> Boolean -> Boolean -> PhaserSpineGameObject -> Effect PhaserSpineGameObject
play = _method3 "play"

setSkinByName :: String -> PhaserSpineGameObject -> Effect PhaserSpineGameObject
setSkinByName = _method1 "setSkinByName"
