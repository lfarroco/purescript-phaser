module Graphics.Phaser.TileMap where

import Data.Function.Uncurried (Fn2, runFn2)
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
  , tilesets :: Array PhaserTileSet
  } ->
  Effect PhaserLayer

foreign import loadTilemapTileJSONImpl :: Fn2 String String (Effect PhaserScene)

loadTilemapTileJSON :: String -> String -> Effect PhaserScene
loadTilemapTileJSON = runFn2 loadTilemapTileJSONImpl
