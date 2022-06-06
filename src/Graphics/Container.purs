module Graphics.Phaser.Container where

import Prelude
import Data.Maybe (Maybe)
import Data.Nullable (toMaybe)
import Effect (Effect)
import Graphics.Phaser.CoreTypes (class GameObject)
import Graphics.Phaser.ForeignTypes (PhaserContainer, PhaserScene)
import Utils.FFI (_getProp, _method1, _return0, getNullable)

-- | Creates a new container that belongs to the given scene
create :: PhaserScene -> Effect PhaserContainer
create = _getProp "add" >=> _return0 "container"

-- | Inserts a game object as a child of the given container
addChild :: forall a. GameObject a => a -> PhaserContainer -> Effect PhaserContainer
addChild = _method1 "add"

-- | Removes all children from a container - the argument controls if they
-- | are destroyed as well
removeAll :: Boolean -> PhaserContainer -> Effect PhaserContainer
removeAll = _method1 "removeAll"

-- | Returns an array of the container's game objects.
list :: forall a. GameObject a => PhaserContainer -> Effect (Array a)
list = _getProp "list"

getByName :: forall a. GameObject a => String -> PhaserContainer -> Effect (Maybe a)
getByName k obj = do
  v <- getNullable "getByName(v1)" k obj
  pure $ toMaybe v
