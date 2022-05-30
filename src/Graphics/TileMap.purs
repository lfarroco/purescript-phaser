module Graphics.Phaser.TileMap where

import Prelude
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserImage, PhaserLayer, PhaserLayerData, PhaserMapData, PhaserScene, PhaserTile, PhaserTileMap, PhaserTileSet)
import Utils.FFI (_getProp, _return1, return2)

-- Docs: https://newdocs.phaser.io/docs/3.55.2/Phaser.Types.Tilemaps.TilemapConfig
type TilemapConfig
  = { key :: String
    , data :: Array (Array Int)
    , tileWidth :: Int
    , tileHeight :: Int
    , width :: Int
    , height :: Int
    , insertNull :: Boolean
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

makeTileMap :: TilemapConfig -> PhaserScene -> Effect PhaserTileMap
makeTileMap config = _getProp "make" >=> _return1 "tilemap" config

addTilesetImage :: String -> TilesetDesc -> PhaserTileMap -> Effect PhaserTileSet
addTilesetImage tilesetName config tileMap =
  return2
    """ addTilesetImage(
        v1,
        v2.key,
        v2.tileWidth,
        v2.tileHeight,
        v2.tileMargin,
        v2.tileSpacing,
        v2.gid
      )"""
    tilesetName
    config
    tileMap

type TilesetDesc
  = { key :: String
    , tileWidth :: Int
    , tileHeight :: Int
    , tileMargin :: Int
    , tileSpacing :: Int
    , gid :: Int
    }

createLayer ::
  String ->
  Array PhaserTileSet ->
  PhaserTileMap ->
  Effect PhaserLayer
createLayer = return2 "createLayer(v1,v2)"

tilesets :: PhaserTileMap -> Effect (Array PhaserTileSet)
tilesets = _getProp "tilesets"
