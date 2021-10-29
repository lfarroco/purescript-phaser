module Graphics.Phaser.TileMap
  ( makeTileMap
  , defaultTilesetDesc
  , createLayer
  , addTilesetImage
  , tilesets
  ) where

import Prelude
import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Graphics.Phaser.ForeignTypes (PhaserLayer, PhaserScene, PhaserTileMap, PhaserTileSet)
import Option (class FromRecord, Option, fromRecord)

-- Corresponds to https://newdocs.phaser.io/docs/3.55.2/Phaser.Types.Tilemaps.TilemapConfig
-- TODO: Current impl is missing quite a few fields, make default?
-- All values are optional
type MapDataConfig
  = { key :: String
    , data :: Array (Array Int)
    , tileHeight :: Int
    , tileWidth :: Int
    }

foreign import makeTileMapImpl ::
  EffectFn2
    PhaserScene
    MapDataConfig
    PhaserTileMap

makeTileMap :: PhaserScene -> MapDataConfig -> Effect PhaserTileMap
makeTileMap = runEffectFn2 makeTileMapImpl

foreign import addTilesetImageImpl ::
  EffectFn3
    PhaserTileMap
    String
    (Option TilesetDesc)
    PhaserTileSet

-- | The argument of type `given` must be any record which is a subset of
-- | `TilesetDesc`
addTilesetImage ::
  forall given.
  FromRecord given () TilesetDesc =>
  PhaserTileMap -> String -> Record given -> Effect PhaserTileSet
addTilesetImage tileMap tilesetName given =
  runEffectFn3
    addTilesetImageImpl
    tileMap
    tilesetName
    -- Pass the given record to js, which expects an option type
    (fromRecord given)

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
