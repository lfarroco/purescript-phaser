module Graphics.Phaser.GameObjects.GameObject
  ( newGameObject
  , addToDisplayList
  , addtoUpdateList
  , addToScene
  , destroy
  , disableInteractive
  , getData
  , getIndexList
  , incData
  , removeFromDisplayList
  , removeFromUpdateList
  , removeInteractive
  , removedFromScene
  , setActive
  , setData
  , setDataEnabled
  , setInteractive
  , setName
  , setState
  , toJSON
  , toggleData
  , update
  , willRender
  , active
  , body
  , cameraFilter
  , data_
  , displayList
  , ignoreDestroy
  , input
  , name
  , parentContainer
  , renderFlags
  , scene
  , state
  , tabIndex
  , type_
  ) where

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1, EffectFn2, runEffectFn2)
import Graphics.Phaser.Types (class GameObject, Camera, Container, DataManager, DisplayList, GameObjectInstance, InteractiveObject, PhysicsBody, SceneInstance)

foreign import newGameObjectImpl :: EffectFn2 SceneInstance String GameObjectInstance

newGameObject :: SceneInstance -> String -> Effect GameObjectInstance
newGameObject = runEffectFn2 newGameObjectImpl

foreign import activeImpl :: forall a. EffectFn1 a Boolean

active :: forall a. GameObject a => a -> Effect Boolean
active = runEffectFn1 activeImpl

foreign import bodyImpl :: forall a. EffectFn1 a (Nullable PhysicsBody)

body :: forall a. GameObject a => a -> Effect (Maybe PhysicsBody)
body = runEffectFn1 bodyImpl >=> (toMaybe >>> pure)

foreign import cameraFilterImpl :: forall a. EffectFn1 a Number

cameraFilter :: forall a. GameObject a => a -> Effect Number
cameraFilter = runEffectFn1 cameraFilterImpl

foreign import dataImpl :: forall a. EffectFn1 a DataManager

data_ :: forall a. GameObject a => a -> Effect DataManager
data_ = runEffectFn1 dataImpl

foreign import displayListImpl :: forall a. EffectFn1 a DisplayList

displayList :: forall a. GameObject a => a -> Effect DisplayList
displayList = runEffectFn1 displayListImpl

foreign import ignoreDestroyImpl :: forall a. EffectFn1 a Boolean

ignoreDestroy :: forall a. GameObject a => a -> Effect Boolean
ignoreDestroy = runEffectFn1 ignoreDestroyImpl

foreign import inputImpl :: forall a. EffectFn1 a (Nullable InteractiveObject)

input :: forall a. GameObject a => a -> Effect (Maybe InteractiveObject)
input = runEffectFn1 inputImpl >=> (toMaybe >>> pure)

foreign import nameImpl :: forall a. EffectFn1 a String

name :: forall a. GameObject a => a -> Effect String
name = runEffectFn1 nameImpl

foreign import parentContainerImpl :: forall a. EffectFn1 a Container

parentContainer :: forall a. GameObject a => a -> Effect Container
parentContainer = runEffectFn1 parentContainerImpl

foreign import renderFlagsImpl :: forall a. EffectFn1 a Number

renderFlags :: forall a. GameObject a => a -> Effect Number
renderFlags = runEffectFn1 renderFlagsImpl

foreign import sceneImpl :: forall a. EffectFn1 a SceneInstance

scene :: forall a. GameObject a => a -> Effect SceneInstance
scene = runEffectFn1 sceneImpl

foreign import stateImpl :: forall a. EffectFn1 a String

state :: forall a. GameObject a => a -> Effect String
state = runEffectFn1 stateImpl

foreign import tabIndexImpl :: forall a. EffectFn1 a Number

tabIndex :: forall a. GameObject a => a -> Effect Number
tabIndex = runEffectFn1 tabIndexImpl

foreign import typeImpl :: forall a. EffectFn1 a String

type_ :: forall a. GameObject a => a -> Effect String
type_ = runEffectFn1 typeImpl

foreign import addToDisplayListImpl :: forall gameobject. EffectFn1 gameobject gameobject

addToDisplayList :: forall gameobject. GameObject gameobject => gameobject -> Effect gameobject
addToDisplayList = runEffectFn1 addToDisplayListImpl

foreign import addtoUpdateListImpl :: forall gameobject. EffectFn1 gameobject gameobject

addtoUpdateList :: forall gameobject. GameObject gameobject => gameobject -> Effect gameobject
addtoUpdateList = runEffectFn1 addtoUpdateListImpl

foreign import addToSceneImpl :: forall gameobject. EffectFn1 gameobject Unit

addToScene :: forall gameobject. GameObject gameobject => gameobject -> Effect Unit
addToScene = runEffectFn1 addToSceneImpl

foreign import destroyImpl :: forall gameobject. EffectFn1 gameobject Unit

destroy :: forall gameobject. GameObject gameobject => gameobject -> Effect Unit
destroy = runEffectFn1 destroyImpl

foreign import disableInteractiveImpl :: forall gameobject. EffectFn1 gameobject gameobject

disableInteractive :: forall gameobject. GameObject gameobject => gameobject -> Effect gameobject
disableInteractive = runEffectFn1 disableInteractiveImpl

foreign import getDataImpl :: forall gameobject data_. EffectFn2 String gameobject data_

getData :: forall gameobject data_. GameObject gameobject => String -> gameobject -> Effect data_
getData = runEffectFn2 getDataImpl

foreign import getIndexListImpl :: forall gameobject. EffectFn1 gameobject (Array Number)

getIndexList :: forall gameobject. GameObject gameobject => gameobject -> Effect (Array Number)
getIndexList = runEffectFn1 getIndexListImpl

foreign import incDataImpl :: forall gameobject. EffectFn2 Number gameobject gameobject

incData :: forall gameobject. GameObject gameobject => Number -> gameobject -> Effect gameobject
incData = runEffectFn2 incDataImpl

foreign import removeFromDisplayListImpl :: forall gameobject. EffectFn1 gameobject gameobject

removeFromDisplayList :: forall gameobject. GameObject gameobject => gameobject -> Effect gameobject
removeFromDisplayList = runEffectFn1 removeFromDisplayListImpl

foreign import removeFromUpdateListImpl :: forall gameobject. EffectFn1 gameobject gameobject

removeFromUpdateList :: forall gameobject. GameObject gameobject => gameobject -> Effect gameobject
removeFromUpdateList = runEffectFn1 removeFromUpdateListImpl

foreign import removeInteractiveImpl :: forall gameobject. EffectFn1 gameobject gameobject

removeInteractive :: forall gameobject. GameObject gameobject => gameobject -> Effect gameobject
removeInteractive = runEffectFn1 removeInteractiveImpl

foreign import removedFromSceneImpl :: forall gameobject. EffectFn1 gameobject Unit

removedFromScene :: forall gameobject. GameObject gameobject => gameobject -> Effect Unit
removedFromScene = runEffectFn1 removedFromSceneImpl

foreign import setActiveImpl :: forall gameobject. EffectFn2 Boolean gameobject gameobject

setActive :: forall gameobject. GameObject gameobject => Boolean -> gameobject -> Effect gameobject
setActive = runEffectFn2 setActiveImpl

foreign import setDataImpl :: forall gameobject. EffectFn2 String gameobject gameobject

setData :: forall gameobject. GameObject gameobject => String -> gameobject -> Effect gameobject
setData = runEffectFn2 setDataImpl

foreign import setDataEnabledImpl :: forall gameobject. EffectFn1 gameobject gameobject

setDataEnabled :: forall gameobject. GameObject gameobject => gameobject -> Effect gameobject
setDataEnabled = runEffectFn1 setDataEnabledImpl

foreign import setInteractiveImpl :: forall gameobject. EffectFn1 gameobject gameobject

setInteractive :: forall gameobject. GameObject gameobject => gameobject -> Effect gameobject
setInteractive = runEffectFn1 setInteractiveImpl

foreign import setNameImpl :: forall gameobject. EffectFn2 String gameobject gameobject

setName :: forall gameobject. GameObject gameobject => String -> gameobject -> Effect gameobject
setName = runEffectFn2 setNameImpl

foreign import setStateImpl :: forall gameobject. EffectFn2 String gameobject gameobject

setState :: forall gameobject. GameObject gameobject => String -> gameobject -> Effect gameobject
setState = runEffectFn2 setStateImpl

foreign import toJSONImpl :: forall gameobject. EffectFn1 gameobject String

toJSON :: forall gameobject. GameObject gameobject => gameobject -> Effect String
toJSON = runEffectFn1 toJSONImpl

foreign import toggleDataImpl :: forall gameobject. EffectFn2 String gameobject gameobject

toggleData :: forall gameobject. GameObject gameobject => String -> gameobject -> Effect gameobject
toggleData = runEffectFn2 toggleDataImpl

foreign import updateImpl :: forall gameobject. EffectFn1 gameobject gameobject

update :: forall gameobject. GameObject gameobject => gameobject -> Effect gameobject
update = runEffectFn1 updateImpl

foreign import willRenderImpl :: forall gameobject. EffectFn2 Camera gameobject Boolean

willRender :: forall gameobject. GameObject gameobject => Camera -> gameobject -> Effect Boolean
willRender = runEffectFn2 willRenderImpl

