module Graphics.Phaser.Container (list, create, addChild, removeChildren) where

import Data.Function.Uncurried (Fn2, runFn2)
import Effect (Effect)
import Graphics.Phaser.GameObject (class GameObject)
import Graphics.Phaser.ForeignTypes (PhaserContainer, PhaserScene)

-- | Creates a new container that belongs to the given scene
foreign import create :: PhaserScene -> (Effect PhaserContainer)

foreign import addChildImpl :: forall a. Fn2 a PhaserContainer (Effect PhaserContainer)

-- | Inserts a game object as a child of the given container
addChild :: forall a. GameObject a => a -> PhaserContainer -> Effect PhaserContainer
addChild = runFn2 addChildImpl

-- | Removes all children from a container
foreign import removeChildren :: PhaserContainer -> Effect PhaserContainer

foreign import listImpl :: forall a. PhaserContainer -> Array a

-- | Returns an array of the container's game objects.
list :: forall a. GameObject a => PhaserContainer -> Array a
list = listImpl
