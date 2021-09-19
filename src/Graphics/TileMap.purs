module Graphics.Phaser.TileMap
  ( makeTileMap
  , defaultTilesetDesc
  , createLayer
  , addTilesetImage
  , tilesets
  ) where

import Data.Nullable (Nullable, null)
import Data.Show (class Show)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Graphics.Phaser.ForeignTypes (PhaserLayer, PhaserScene, PhaserTileMap, PhaserTileSet)

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

makeTileMap ::
  PhaserScene ->
  MapDataConfig ->
  Effect PhaserTileMap
makeTileMap = runEffectFn2 makeTileMapImpl

type TilesetDesc
  = { key :: Nullable String
    , tileWidth :: Nullable Int
    , tileHeight :: Nullable Int
    , tileMargin :: Nullable Int
    , tileSpacing :: Nullable Int
    , gid :: Nullable Int
    }

defaultTilesetDesc :: TilesetDesc
defaultTilesetDesc =
  { key: null
  , tileWidth: null
  , tileHeight: null
  , tileMargin: null
  , tileSpacing: null
  , gid: null
  }

foreign import addTilesetImageImpl ::
  EffectFn3
    PhaserTileMap
    String
    TilesetDesc
    PhaserTileSet

addTilesetImage ::
  PhaserTileMap ->
  String ->
  TilesetDesc ->
  Effect PhaserTileSet
addTilesetImage = runEffectFn3 addTilesetImageImpl

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
