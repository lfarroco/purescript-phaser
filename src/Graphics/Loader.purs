module Graphics.Phaser.Loader where

import Prelude
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserLoaderPlugin, PhaserScene)
import Utils.FFI (_getProp, _method1, _method2, _method3, _return1, _return2, _return3)

getLoaderPlugin :: PhaserScene -> Effect PhaserLoaderPlugin
getLoaderPlugin = _getProp "load"

-- TODO: refactor to accept loader plugin instead of scene
setBaseUrl :: String -> PhaserScene -> Effect PhaserScene
setBaseUrl v1 = _getProp "load" >=> _method1 "setBaseURL" v1

setPath :: String -> PhaserScene -> Effect PhaserScene
setPath v1 = _getProp "load" >=> _method1 "setPath" v1

type AssetLoadConfig
  = { key :: String, path :: String }

loadImage :: AssetLoadConfig -> PhaserScene -> Effect PhaserScene
loadImage { key, path } scn = do
  void $ _getProp "load" scn
    >>= _return2 "image" key path
  pure scn

loadAtlas :: String -> String -> String -> PhaserScene -> Effect PhaserScene
loadAtlas v1 v2 v3 scn =
  _getProp "load" scn
    >>= _method3 "atlas" v1 v2 v3
    >>= const (pure scn)

loadPlugin :: String -> String -> PhaserScene -> Effect PhaserScene
loadPlugin v1 v2 scn = _getProp "load" scn >>= _method2 "plugin" v1 v2 >>= const (pure scn)

loadScene :: String -> String -> String -> PhaserScene -> Effect PhaserScene
loadScene key url sceneKey scn =
  _getProp "load" scn
    >>= _return1 "scenePlugin" { key, url, sceneKey }
    >>= const (pure scn)

type LoadSpriteSheetConfig
  = { frameWidth :: Number
    , frameHeight :: Number
    }

loadSpritesheet ::
  AssetLoadConfig ->
  LoadSpriteSheetConfig ->
  PhaserScene ->
  Effect PhaserScene
loadSpritesheet { key, path } v2 scn =
  _getProp "load" scn
    >>= _return3 "spritesheet" key path v2
    >>= const (pure scn)

-- loadTilemapTiledJSON ::
--   String ->
--   String ->
--   PhaserScene ->
--   Effect PhaserScene
-- | https://photonstorm.github.io/phaser3-docs/Phaser.Loader.LoaderPlugin.html#tilemapTiledJSON__anchor
loadTilemapTiledJSON ::
  AssetLoadConfig ->
  PhaserScene ->
  Effect PhaserScene
loadTilemapTiledJSON { key, path } scn =
  _getProp "load" scn
    >>= _method2 "tilemapTiledJSON" key path
    >>= const (pure scn)

type AudioLoadConfig
  = { key :: String, paths :: Array String }

-- | When loading an audio file you can provide an array of audio files with different extensions for the the same key.
-- | This allows you to support multiple browsers and platforms.
-- | Example : https://labs.phaser.io/edit.html?src=src\audio\Web%20Audio\basic%20playback%20and%20events.js
loadAudio :: AudioLoadConfig -> PhaserScene -> Effect PhaserScene
loadAudio { key, paths } = _getProp "load" >=> _return2 "audio" key paths
