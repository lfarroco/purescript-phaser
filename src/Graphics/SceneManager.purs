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
import Utils.FFI (getNullable, getProperty, method0, method3)


-- | https://photonstorm.github.io/phaser3-docs/Phaser.Scenes.SceneManager.html#add__anchor
-- | This method accpts multiple data types
-- | We are opting to use the version with a concrete Phaser Scene instance
add :: String ->  PhaserScene  -> Boolean -> SceneManager -> Effect SceneManager
add = method3 "add(v1,v2,v3)"
 
class HasSceneManager :: forall k. k -> Constraint
class HasSceneManager a 

getSceneManager :: forall a. HasSceneManager a => a -> Effect SceneManager
getSceneManager = getProperty "scene"

instance HasSceneManager PhaserScene 
instance HasSceneManager PhaserGame 

getByKey :: String -> SceneManager -> Effect (Maybe PhaserScene)
getByKey key mngr = 
  getNullable "get(v1)" key mngr >>= (toMaybe >>> pure)

sendToBack :: PhaserScene -> Effect PhaserScene
sendToBack = method0 "sendToBack()"

bringToTop ::  PhaserScene -> Effect PhaserScene
bringToTop = method0 "beingToTop()"
