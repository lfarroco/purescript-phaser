module Graphics.Phaser.TileMap where

import Effect (Effect)
import Phaser.Graphics.ForeignTypes (PhaserLayer, PhaserScene, PhaserTileMap, PhaserTileSet)


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
