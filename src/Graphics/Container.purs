module Graphics.Phaser.Container where

import Effect (Effect)
import Graphics.Phaser.CoreTypes (class GameObject)
import Graphics.Phaser.ForeignTypes (PhaserContainer, PhaserScene)
import Utils.FFI (get, method1, return0)

-- | Creates a new container that belongs to the given scene
create :: PhaserScene -> Effect PhaserContainer
create =  return0 "add.container()"

-- | Inserts a game object as a child of the given container
addChild :: forall a. GameObject a => a -> PhaserContainer -> Effect PhaserContainer
addChild = method1 "add(v1)"

-- | Removes all children from a container - the argument controls if they
-- | are destroyed as well
removeAll :: Boolean -> PhaserContainer -> Effect PhaserContainer
removeAll = method1 "removeAll(v1)"

-- | Returns an array of the container's game objects.
list :: forall a. GameObject a => PhaserContainer -> Effect (Array a)
list = get "list"
