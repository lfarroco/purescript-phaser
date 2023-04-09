module Graphics.Phaser.Types where

-- | Scene
foreign import data SceneInstance :: Type

class Scene :: forall k. k -> Constraint
class Scene a

instance Scene SceneInstance

-- | Event Emitter
foreign import data EventEmitterInstance :: Type

class EventEmitter :: forall k. k -> Constraint
class EventEmitter a

instance EventEmitter EventEmitterInstance

-- | Game Object
foreign import data GameObjectInstance :: Type

class GameObject :: forall k. k -> Constraint
class (EventEmitter a) <= GameObject a

instance EventEmitter GameObjectInstance
instance GameObject GameObjectInstance

-- | Others
foreign import data PhysicsBody :: Type
foreign import data Camera :: Type

foreign import data DataManager :: Type
foreign import data DisplayList :: Type

foreign import data Container :: Type

foreign import data InteractiveObject :: Type
