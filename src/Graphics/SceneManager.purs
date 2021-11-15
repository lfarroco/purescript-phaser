module Graphics.Phaser.SceneManager
  ( addScene
  , bringToTop
  , getSceneManager
  , getByKey
  , sendToBack
  , class HasSceneManager
  , Start(..)
  ) where

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn4, runEffectFn1, runEffectFn2, runEffectFn4)
import Graphics.Phaser.CoreTypes (CreateSceneFromObjectConfig)
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserScene, SceneManager)
import Option (class FromRecord, Option, fromRecord)

{-
Im leaving this as a comment for now but it seems unnecessary.

=== Possible API to support multiple scene config types ===
  - Currently runs into issues with converting JS callbacks

newtype SceneObject
  = SceneObject (Option CreateSceneFromObjectConfigFn)

newtype SceneSettingsConfig
  = SceneSettingsConfig (Option SettingsConfig)

-- Note that this function would be redundant if we implement row type pattern
-- matching in `addScene`.
-- | Convenience function that takes an `Option` record to create a
-- | `SceneObject`.
sceneObject ::
  forall object.
  FromRecord object () CreateSceneFromObjectConfig =>
  Record object -> SceneObject
sceneObject = SceneObject <<< mkSceneConfig

-- | This class is used to enumerate valid scene config types to pass to
-- | `addScene`.
class AddSceneConfig :: forall k. k -> Constraint
-- TODO: use an adt/record/variant instead? Remove this todo if not necessary
class AddSceneConfig sceneConfig

instance AddSceneConfig PhaserScene

instance AddSceneConfig SceneObject

instance AddSceneConfig SceneSettingsConfig

type CreateSceneFromObjectConfigFn
  = ( init :: EffectFn1 PhaserScene Unit
    , preload :: EffectFn1 PhaserScene Unit
    , create :: EffectFn1 PhaserScene Unit
    , update :: EffectFn1 PhaserScene Unit
    )

-- Callbacks must be wrapped with mkEffectFn#
mkSceneConfig :: forall config.
  FromRecord config () CreateSceneFromObjectConfig =>
  Record config -> Option CreateSceneFromObjectConfigFn
mkSceneConfig config = 
  modify'
  { init: mk1
  , preload: mk1
  , create: mk1
  , update: mk1
  }
  (fromRecord config)
  where
  -- Specify the type of mkEffectFn1
  mk1 :: (PhaserScene -> Effect Unit) -> EffectFn1 PhaserScene Unit
  mk1 = mkEffectFn1

-}

data Start = Start | NoStart

-- | Type `a` must be a recognized scene config for `addScene`.
foreign import addSceneImpl ::
  EffectFn4 String (Option CreateSceneFromObjectConfig) Boolean PhaserGame (Nullable PhaserScene)

-- | ==== Parameters ====
-- | Key             - A unique key used to reference the Scene, i.e. MainMenu or Level1.
-- | Sceneconfig     - A scene config object
-- | AutoStart       - If the scene should start in parallel right now (default false)
-- | 
-- | Docs: https://newdocs.phaser.io/docs/3.52.0/Phaser.Scenes.SceneManager#add
addScene ::
  forall config. 
  FromRecord config () CreateSceneFromObjectConfig =>
  String ->  Record config -> Start -> PhaserGame -> Effect (Maybe PhaserScene)
addScene key sceneConfig autoStart game = toMaybe <$> runEffectFn4
    addSceneImpl key (fromRecord sceneConfig) start game
    where
      start = case autoStart of
        Start -> true
        NoStart -> false
        

class HasSceneManager a where
  getSceneManager :: a -> SceneManager

foreign import getSceneManagerImpl :: forall a. a -> SceneManager

instance HasSceneManager PhaserScene where
  getSceneManager = getSceneManagerImpl

instance HasSceneManager PhaserGame where
  getSceneManager = getSceneManagerImpl

foreign import getByKeyImpl :: EffectFn2 SceneManager String PhaserScene

getByKey :: SceneManager -> String -> Effect PhaserScene
getByKey = runEffectFn2 getByKeyImpl

foreign import sendToBackImpl :: EffectFn1 PhaserScene Unit

sendToBack :: PhaserScene -> Effect Unit
sendToBack = runEffectFn1 sendToBackImpl

foreign import bringToTopImpl :: EffectFn1 PhaserScene Unit

bringToTop :: PhaserScene -> Effect Unit
bringToTop = runEffectFn1 bringToTopImpl
