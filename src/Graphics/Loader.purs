module Graphics.Phaser.Loader where

import Prelude

import Effect (Effect)
import Graphics.Phaser.Scene (PhaserScene)

foreign import setBaseUrl :: String -> PhaserScene -> Effect Unit

foreign import setPath :: String -> PhaserScene  -> Effect Unit

foreign import loadImages  :: Array {key:: String, path:: String} -> PhaserScene -> Effect Unit


