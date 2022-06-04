module Graphics.Phaser.TileMap where

import Prelude

import Data.Options (Options, options)
import Effect (Effect)
import Graphics.Canvas (Dimensions)
import Graphics.Phaser.ForeignTypes (PhaserImage, PhaserLayer, PhaserLayerData, PhaserMapData, PhaserScene, PhaserTile, PhaserTileMap, PhaserTileSet)
import Internal.Utils (_opt)
import Utils.FFI (_getProp, _method2, _return1, _return2)

data TilemapConfig

-- Docs: https://newdocs.phaser.io/docs/3.55.2/Phaser.Types.Tilemaps.TilemapConfig
tilemapConfig ::
  { key :: String -> Options TilemapConfig
  , data :: Array (Array Int) -> Options TilemapConfig
  , tileWidth :: Int -> Options TilemapConfig
  , tileHeight :: Int -> Options TilemapConfig
  , width :: Int -> Options TilemapConfig
  , height :: Int -> Options TilemapConfig
  , insertNull :: Boolean -> Options TilemapConfig
  }
tilemapConfig =
  { key: _opt "key"
  , data: _opt "data"
  , tileWidth: _opt "tileWidth"
  , tileHeight: _opt "tileHeight"
  , width: _opt "width"
  , height: _opt "height"
  , insertNull: _opt "insertNull"
  }

-- | Docs: https://newdocs.phaser.io/docs/3.55.2/Phaser.Types.Tilemaps.MapDataConfig
type MapDataConfig
  = ( name :: String
    , width :: Number
    , height :: Number
    , tileWidth :: Number
    , tileHeight :: Number
    , widthInPixels :: Int
    , heightInPixels :: Int
    , format :: Number
    , orientation :: String
    , renderOrder :: String
    , version :: Number
    , properties :: Number
    , layers :: Array PhaserLayerData
    , images :: Array PhaserMapData
    -- TODO, objects :: Array TileImageLayer
    -- TODO, collision :: Object TileImageLayer
    , tilesets :: Array PhaserTileSet
    , imageCollections :: Array PhaserImage
    , tiles :: Array PhaserTile
    )

makeTileMap :: Options TilemapConfig -> PhaserScene -> Effect PhaserTileMap
makeTileMap config = _getProp "make" >=> _return1 "tilemap" (options config)

addTilesetImage :: String -> String -> PhaserTileMap -> Effect PhaserTileSet
addTilesetImage = _return2 "addTilesetImage"

setTileSize :: Dimensions -> PhaserTileSet -> Effect PhaserTileSet
setTileSize { width, height } = _method2 "setTileSize" width height

createLayer ::
  String ->
  Array PhaserTileSet ->
  PhaserTileMap ->
  Effect PhaserLayer
createLayer = _return2 "createLayer"

tilesets :: PhaserTileMap -> Effect (Array PhaserTileSet)
tilesets = _getProp "tilesets"
