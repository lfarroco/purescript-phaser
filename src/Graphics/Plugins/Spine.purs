module Graphics.Phaser.Plugins.Spine where

import Prelude
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserScene, PhaserSpineGameObject)
import Graphics.Phaser.CoreTypes (Vector)
import Utils.FFI(_getProp, _method3, _return5 , _return4)

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

createSkeletonFromScene :: { position :: Vector, skeletonKey :: String, animation :: String, preMultipliedAlpha :: Boolean  } -> PhaserScene  -> Effect PhaserSpineGameObject
createSkeletonFromScene {position, skeletonKey, animation, preMultipliedAlpha} = 
  _getProp "add" 
    >=> _return5 "spine" position.x position.y skeletonKey animation preMultipliedAlpha

play :: String -> Boolean -> Boolean -> PhaserSpineGameObject -> Effect PhaserSpineGameObject
play = _method3 "play"