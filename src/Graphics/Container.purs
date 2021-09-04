module Graphics.Phaser.Container (create, addChild, removeChildren, list) where

import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)
import Effect (Effect)
import Graphics.Phaser.GameObject (class GameObject)
import Graphics.Phaser.ForeignTypes (PhaserContainer, PhaserScene)

foreign import createImpl :: EffectFn1 PhaserScene PhaserContainer

-- | Creates a new container that belongs to the given scene
create :: PhaserScene -> Effect PhaserContainer
create = runEffectFn1 createImpl

foreign import addChildImpl :: forall a. EffectFn2 a PhaserContainer PhaserContainer

-- | Inserts a game object as a child of the given container
addChild :: forall a. GameObject a => a -> PhaserContainer -> Effect PhaserContainer
addChild = runEffectFn2 addChildImpl

foreign import removeChildrenImpl :: EffectFn1 PhaserContainer PhaserContainer

-- | Removes all children from a container
removeChildren :: PhaserContainer -> Effect PhaserContainer
removeChildren = runEffectFn1 removeChildrenImpl

foreign import listImpl :: forall a. EffectFn1 PhaserContainer (Array a)

-- | Returns an array of the container's game objects.
list :: forall a. GameObject a => PhaserContainer -> Effect (Array a)
list = runEffectFn1 listImpl
