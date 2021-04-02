module Graphics.Phaser.Loader where

import Prelude
import Data.Function.Uncurried (Fn2, runFn2)
import Effect (Effect)
import Phaser.Graphics.ForeignTypes (PhaserScene)

foreign import setBaseUrl :: String -> PhaserScene -> Effect Unit

foreign import setPath :: String -> PhaserScene -> Effect Unit

foreign import loadImagesImpl :: Fn2 (Array { key :: String, path :: String }) PhaserScene (Effect Unit)

loadImages :: Array { key :: String , path :: String } -> PhaserScene -> Effect Unit
loadImages = runFn2 loadImagesImpl
