module Graphics.Phaser.SceneManager
  ( add
  , bringToTop
  , getSceneManager
  , getByKey
  , sendToBack
  , class HasSceneManager
  ) where

{-
  Directly calling the scene manager is discouraged by the Phaser docs - use
  the ScenePlugin instead.
  From Phaser docs:
  /**
   * The Scene Manager.
   * 
   * The Scene Manager is a Game level system, responsible for creating, processing and updating all of the
   * Scenes in a Game instance.
   * 
   * You should not usually interact directly with the Scene Manager at all. Instead, you should use
   * the Scene Plugin, which is available from every Scene in your game via the `this.scene` property.
   * 
   * Using methods in this Scene Manager directly will break queued operations and can cause runtime
   * errors. Instead, go via the Scene Plugin. Every feature this Scene Manager provides is also
   * available via the Scene Plugin.
   */
 -}

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (toMaybe)
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserScene, SceneManager)
import Utils.FFI (_getProp, _method0, _method3, getNullable)


-- | https://photonstorm.github.io/phaser3-docs/Phaser.Scenes.SceneManager.html#add__anchor
-- | This method accpts multiple data types
-- | We are opting to use the version with a concrete Phaser Scene instance
add :: String ->  PhaserScene  -> Boolean -> SceneManager -> Effect SceneManager
add = _method3 "add"
 
class HasSceneManager a  where
  getSceneManager :: a -> Effect SceneManager

instance HasSceneManager PhaserScene  where
  getSceneManager = _getProp "scene" >=> _getProp "manager"
 
instance HasSceneManager PhaserGame  where
  getSceneManager = _getProp "scene"

getByKey :: String -> SceneManager -> Effect (Maybe PhaserScene)
getByKey key mngr = 
  getNullable "getScene" key mngr >>= (toMaybe >>> pure)

sendToBack :: PhaserScene -> Effect PhaserScene
sendToBack = _method0 "sendToBack"

bringToTop ::  PhaserScene -> Effect PhaserScene
bringToTop = _method0 "beingToTop"
