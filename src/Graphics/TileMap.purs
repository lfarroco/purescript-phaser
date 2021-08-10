module Graphics.Phaser.TileMap where

-- import Data.Maybe (Maybe)

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, runEffectFn1, runEffectFn2, runEffectFn3)
import Phaser.Graphics.ForeignTypes (PhaserLayer, PhaserScene, PhaserTileMap, PhaserTileSet)


foreign import makeTileMapImpl ::
  EffectFn3
  PhaserScene
  (Array (Array Int))
  { tileHeight :: Int
  , tileWidth :: Int
  }
  PhaserTileMap

makeTileMap :: PhaserScene
  -> Array (Array Int)
  -> { tileHeight :: Int
     , tileWidth :: Int
     }
  -> Effect PhaserTileMap
makeTileMap = runEffectFn3 makeTileMapImpl


foreign import addTilesetImageImpl ::
  EffectFn3
  PhaserTileMap
  String
  { key :: String
  , tileWidth :: Int
  , tileHeight :: Int
  , tileMargin :: Int
  , tileSpacing :: Int
  , gid :: Int
  }
   PhaserTileSet

addTilesetImage ::
  PhaserTileMap ->
  String ->
  { key :: String
  , tileWidth :: Int
  , tileHeight :: Int
  , tileMargin :: Int
  , tileSpacing :: Int
  , gid :: Int
  } ->
  Effect PhaserTileSet
addTilesetImage = runEffectFn3 addTilesetImageImpl

foreign import createLayerImpl ::
  EffectFn2
  PhaserTileMap
  { tilesets :: Array PhaserTileSet
  }
  PhaserLayer

createLayer
  :: PhaserTileMap
  -> { tilesets :: Array PhaserTileSet
     }
  -> Effect PhaserLayer
createLayer = runEffectFn2 createLayerImpl


foreign import loadTilemapTileJSONImpl ::
  EffectFn3 String String PhaserScene PhaserScene

loadTilemapTileJSON
  :: String
  -> String
  -> PhaserScene
  -> Effect PhaserScene
loadTilemapTileJSON = runEffectFn3 loadTilemapTileJSONImpl
