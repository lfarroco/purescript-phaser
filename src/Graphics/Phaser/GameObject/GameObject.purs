-- https://newdocs.phaser.io/docs/3.55.1/Phaser.GameObjects.GameObject

module Graphics.Phaser.GameObject.GameObject where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)

class EventEmitter_ :: forall k. k -> Constraint
class EventEmitter_ a

class GameObjectClass :: forall k. k -> Constraint
class (EventEmitter_ a) <= GameObjectClass a

instance GameObjectClass GameObject_

instance EventEmitter_ GameObject_

foreign import data GameObject_ :: Type

-- move this to scene module
foreign import data Scene_ :: Type

foreign import data DisplayList :: Type

foreign import newGameObjectImpl :: EffectFn2 Scene_ String GameObject_

newGameObject :: Scene_ -> String -> Effect GameObject_
newGameObject = runEffectFn2 newGameObjectImpl

foreign import activeImpl :: GameObject_ -> Effect Boolean

-- foreign import addToDisplayListImpl :: DisplayList -> GameObject_ -> Effect GameObject
-- foreign import addToUpdateListImpl :: GameObject_ -> Effect GameObject
-- foreign import addedToSceneImpl :: GameObject_ -> Effect Boolean
-- foreign import bodyImpl :: GameObject_ -> Effect Body
-- foreign import cameraFilterImpl :: GameObject_ -> Effect Number
-- foreign import dataImpl :: GameObject_ -> Effect DataManager
-- foreign import destroyImpl :: GameObject_ -> Effect Unit
-- foreign import disableInteractiveImpl :: GameObject_ -> Effect Unit
-- foreign import displayListImpl :: GameObject_ -> Effect DisplayList
-- foreign import getDataImpl :: GameObject_ -> Effect DataManager
-- foreign import getIndexListImpl :: GameObject_ -> Effect (Array Int)
-- foreign import ignoreDestroyImpl :: GameObject_ -> Effect Boolean
-- foreign import incDataImpl :: forall v. String -> v -> GameObject_ -> Effect Unit
-- foreign import inputImpl :: GameObject_ -> Effect InteractiveObject
-- foreign import nameImpl :: GameObject_ -> Effect String
-- foreign import parentContainerImpl :: GameObject_ -> Effect Container
-- foreign import removeFromDisplayListImpl :: GameObject_ -> Effect GameObject_
-- foreign import removeFromUpdateListImpl :: GameObject_ -> Effect GameObject_
-- foreign import removeInteractiveImpl :: GameObject_ -> Effect GameObject_
-- foreign import renderFlagsImpl :: GameObject_ -> Effect Number
-- foreign import renderMaskImpl :: GameObject_ -> Effect Number
-- foreign import sceneImpl :: GameObject_ -> Effect Scene_
-- foreign import setActiveImpl :: GameObject_ -> Boolean -> Effect GameObject_
-- foreign import setDataEnabledImpl :: GameObject_ -> Effect GameObject_
-- foreign import setDataImpl :: forall v. String -> v -> GameObject_ -> Effect GameObject_
-- foreign import setInteractiveImpl :: forall v. GameObject_ -> v -> Effect GameObject_
