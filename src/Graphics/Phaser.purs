module Graphics.Phaser
  ( create
  , createWithConfig
  , createWithUnsafeConfig
  , setDimentions
  , addScene
  ) where

import Prelude
import Data.Foreign.EasyFFI (unsafeForeignProcedure)
import Data.Options (Options, options)
import Effect (Effect)
import Graphics.Phaser.CoreTypes (Dimensions)
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserScene)
import Graphics.Phaser.GameConfig (GameConfig)
import Utils.FFI (method3, setProperty)

create :: Effect PhaserGame
create = unsafeForeignProcedure [ "" ] "return new Phaser.Game()"

createWithConfig :: Options GameConfig -> Effect PhaserGame
createWithConfig opts = createWithUnsafeConfig (options opts)

-- | This function allows passing anything to Phaser's config
-- | You can use it for properties that are not defined in this library
-- | https://photonstorm.github.io/phaser3-docs/Phaser.Types.Core.html#.GameConfig
createWithUnsafeConfig :: forall a. a -> Effect PhaserGame
createWithUnsafeConfig = unsafeForeignProcedure [ "config", "" ] "return new Phaser.Game(config)"

setDimentions :: Dimensions -> PhaserGame -> Effect PhaserGame
setDimentions { width, height } game = do
  setProperty "config.width=v1" width game
  setProperty "config.height=v1" height game
  pure game

-- | This is a escape hatch to SceneManager's method `add`
-- | This function is provided here to avoid accessing the scene manager directly 
addScene :: String -> PhaserScene -> Boolean -> PhaserGame -> Effect PhaserGame
addScene = method3 "scene.add(v1,v2,v3)"
