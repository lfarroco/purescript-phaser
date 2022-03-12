module Graphics.Phaser.Loader
  ( setBaseUrl
  , setPath
  , loadImage
  , loadAtlas
  , loadSpritesheet
  , loadPlugin
  , loadScene
  , loadTilemapTileJSON
  , loadTilemapTiledJSON
  ) where


import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserScene)
import Utils.FFI (method1, method2, method3)

setBaseUrl :: String -> PhaserScene -> Effect PhaserScene
setBaseUrl = method1 "load.setBaseUrl(v1)"

setPath :: String -> PhaserScene -> Effect PhaserScene
setPath = method1 "load.setPath(v1)"

type ImagePath
  = { key :: String, path :: String }

loadImage :: ImagePath -> PhaserScene -> Effect PhaserScene
loadImage = method1 "load.image(v1.key,v1.path)"

loadAtlas :: String -> String -> String -> PhaserScene -> Effect PhaserScene
loadAtlas = method3 "load.atlas(v1, v2, v3)"

loadPlugin :: String -> String -> PhaserScene -> Effect PhaserScene
loadPlugin = method2 "load.plugin(v1, v2)"

loadScene :: String -> String -> String -> PhaserScene -> Effect PhaserScene
loadScene = method3 "load.scenePlugin({ key: v1, url: v2, sceneKey: v3})"

type LoadSpriteSheetConfig
  = { frameWidth :: Number
    , frameHeight :: Number
    , startFrame :: Int
    , endFrame :: Int
    , margin :: Int
    , spacing :: Int
    }

-- | Key, Texture, Config
loadSpritesheet ::
  String ->
  String ->
  LoadSpriteSheetConfig ->
  PhaserScene ->
  Effect PhaserScene
loadSpritesheet = method3 "load.spritesheet(v1,v2,v3)"

loadTilemapTileJSON ::
  String ->
  String ->
  PhaserScene ->
  Effect PhaserScene
loadTilemapTileJSON = 
  method2 "load.tilemapTileJSON(v1, v2)"


type TiledLoadConfiguration
  = { key :: String, url :: String }

-- | https://photonstorm.github.io/phaser3-docs/Phaser.Loader.LoaderPlugin.html#tilemapTiledJSON__anchor
loadTilemapTiledJSON ::
  (Array TiledLoadConfiguration) ->
  PhaserScene ->
  Effect PhaserScene
loadTilemapTiledJSON = method1 "load.tilemapTiledJSON(v1, v2)"
