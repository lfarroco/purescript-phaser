module Graphics.Phaser.TileMap where

import Effect (Effect)
import Graphics.Phaser.Scene (PhaserScene)

foreign import data PhaserTileMap :: Type

foreign import data PhaserTileSet :: Type

foreign import data PhaserLayer :: Type

foreign import makeTileMap ::
  { scene :: PhaserScene
  , data :: Array (Array Int)
  , tileWidth :: Int
  , tileHeight :: Int
  } ->
  Effect PhaserTileMap

foreign import addTilesetImage ::
  { tileMap :: PhaserTileMap
  , key :: String
  , tileWidth :: Int
  , tileHeight :: Int
  } ->
  Effect PhaserTileSet

foreign import createLayer ::
  { tileMap :: PhaserTileMap
  , tileset :: PhaserTileSet
  } ->
  Effect PhaserLayer
