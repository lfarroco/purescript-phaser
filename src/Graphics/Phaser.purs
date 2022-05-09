module Graphics.Phaser
  ( create
  , setDimentions
  , addScene
  ) where

import Prelude
import Data.Foreign.EasyFFI (unsafeForeignProcedure)
import Effect (Effect)
import Graphics.Phaser.CoreTypes (Dimensions)
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserScene)
import Utils.FFI (method3, setProperty)

create :: Effect PhaserGame
create = unsafeForeignProcedure [ "" ] "return new Phaser.Game()"

setDimentions :: Dimensions -> PhaserGame -> Effect PhaserGame
setDimentions { width, height } game = do
  setProperty "config.width=v1" width game
  setProperty "config.height=v1" height game
  pure game

-- | This is a escape hatch to SceneManager's method `add`
-- | This function is provided here to avoid accessing the scene manager directly 
addScene :: String -> PhaserScene -> Boolean -> PhaserGame -> Effect PhaserGame
addScene = method3 "scene.add(v1,v2,v3)"
