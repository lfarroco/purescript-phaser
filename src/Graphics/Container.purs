module Graphics.Phaser.Container (PhaserContainer, create, addChild, removeChildren) where 

import Prelude

import Data.Function.Uncurried (Fn2, runFn2)
import Effect (Effect)
import Graphics.Phaser.GameObject (class GameObject)
import Graphics.Phaser.Scene (PhaserScene)

foreign import data PhaserContainer :: Type

foreign import createImpl :: Fn2 { x :: Number, y :: Number } PhaserScene (Effect PhaserContainer)

-- | Creates a new container that belongs to the given scene
create :: { x :: Number , y :: Number } -> PhaserScene -> Effect PhaserContainer
create vector scene =
  runFn2 createImpl vector scene

foreign import addChildImpl :: forall a. Fn2  PhaserContainer a (Effect Unit)

-- | Inserts a game object as a child of the given container
addChild :: forall a.  GameObject a => a-> PhaserContainer -> Effect Unit
addChild container obj =
  runFn2 addChildImpl obj container

-- | Removes all children from a container
foreign import removeChildren :: PhaserContainer -> Effect Unit
