module Graphics.Phaser.TileMap
  ( makeTileMap
  , createLayer
  , addTilesetImage
  , tilesets
  ) where

import Prelude
import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Graphics.Phaser.ForeignTypes (PhaserImage, PhaserLayer, PhaserLayerData, PhaserMapData, PhaserScene, PhaserTile, PhaserTileMap, PhaserTileSet)
import Option (class FromRecord, Option, fromRecord)

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

-- | Docs: https://newdocs.phaser.io/docs/3.54.0/Phaser.GameObjects.GameObjectCreator#tilemap
foreign import makeTileMapImpl ::
  EffectFn2
    PhaserScene
    (Option TilemapConfig)
    PhaserTileMap

makeTileMap ::
  forall mapConfig.
  FromRecord mapConfig () TilemapConfig =>
  PhaserScene -> Record mapConfig -> Effect PhaserTileMap
makeTileMap scene mapConfig =
  runEffectFn2
    makeTileMapImpl
    scene
    (fromRecord mapConfig)

foreign import addTilesetImageImpl ::
  EffectFn3
    PhaserTileMap
    String
    (Option TilesetDesc)
    PhaserTileSet

-- | The argument of type `given` must be any record which is a subset of
-- | `TilesetDesc`
addTilesetImage ::
  forall tilesetDesc.
  FromRecord tilesetDesc () TilesetDesc =>
  PhaserTileMap -> String -> Record tilesetDesc -> Effect PhaserTileSet
addTilesetImage tileMap tilesetName tilesetDesc =
  runEffectFn3
    addTilesetImageImpl
    tileMap
    tilesetName
    -- Pass the given record to js, which expects an option type
    (fromRecord tilesetDesc)

type TilesetDesc
  = ( key :: String
    , tileWidth :: Int
    , tileHeight :: Int
    , tileMargin :: Int
    , tileSpacing :: Int
    , gid :: Int
    )

foreign import createLayerImpl ::
  forall a.
  EffectFn3
    PhaserTileMap
    a
    (Array PhaserTileSet)
    PhaserLayer

createLayer ::
  forall a.
  Show a =>
  PhaserTileMap ->
  a ->
  Array PhaserTileSet ->
  Effect PhaserLayer
createLayer = runEffectFn3 createLayerImpl

foreign import tilesets :: PhaserTileMap -> Array PhaserTileSet
