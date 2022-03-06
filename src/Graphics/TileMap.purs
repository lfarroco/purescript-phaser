module Graphics.Phaser.TileMap
  ( makeTileMap
  , createLayer
  , addTilesetImage
  , tilesets
  ) where

import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserImage, PhaserLayer, PhaserLayerData, PhaserMapData, PhaserScene, PhaserTile, PhaserTileMap, PhaserTileSet)
import Option (class FromRecord, Option, fromRecord)
import Utils.FFI (return1, return2, get)

-- Docs: https://newdocs.phaser.io/docs/3.55.2/Phaser.Types.Tilemaps.TilemapConfig
type TilemapConfig
  = ( key :: String
    , data :: Array (Array Int)
    , tileWidth :: Int
    , tileHeight :: Int
    , width :: Int
    , height :: Int
    , insertNull :: Boolean
    )

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

makeTileMap ::
  forall mapConfig.
  FromRecord mapConfig () TilemapConfig =>
  Record mapConfig -> PhaserScene -> Effect PhaserTileMap
makeTileMap mapConfig scene =
  let
    config :: Option TilemapConfig
    config = (fromRecord mapConfig)
  in
    return1 "make.tilemap(v1)" config scene

-- | The argument of type `given` must be any record which is a subset of
-- | `TilesetDesc`
addTilesetImage ::
  forall tilesetDesc.
  FromRecord tilesetDesc () TilesetDesc => String -> Record tilesetDesc -> PhaserTileMap  -> Effect PhaserTileSet
addTilesetImage tilesetName tilesetDesc tileMap  =
  let
      config :: Option TilesetDesc
      config = fromRecord tilesetDesc
   in
    return2 """
      addTilesetImage(
        v1,
        v2.key,
        v2.tileWidth,
        v2.tileHeight,
        v2.tileMargin,
        v2.tileSpacing,
        v2.gid
      )""" tilesetName config tileMap

type TilesetDesc
  = ( key :: String
    , tileWidth :: Int
    , tileHeight :: Int
    , tileMargin :: Int
    , tileSpacing :: Int
    , gid :: Int
    )

createLayer :: 
  String ->
  Array PhaserTileSet ->
  PhaserTileMap ->
  Effect PhaserLayer
createLayer = return2 "createLayer(v1,v2)"


tilesets :: PhaserTileMap -> Array PhaserTileSet
tilesets= get "tilesets"
