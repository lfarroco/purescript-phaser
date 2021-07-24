module Graphics.Phaser.TileMap where

-- import Data.Maybe (Maybe)
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserLayer, PhaserScene, PhaserTileMap, PhaserTileSet)

foreign import makeTileMap ::
  { scene :: PhaserScene
  , data :: Array (Array Int)
  , tileWidth :: Int
  , tileHeight :: Int
  } ->
  Effect PhaserTileMap

foreign import addTilesetImage ::
  { tileMap :: PhaserTileMap
  , name :: String
  -- , key :: String -- Maybe
  , tileWidth :: Int -- Maybe
  , tileHeight :: Int -- Maybe
  } ->
  Effect PhaserTileSet

foreign import createLayer ::
  { tileMap :: PhaserTileMap
  , tilesets :: Array PhaserTileSet
  } ->
  Effect PhaserLayer

foreign import loadTilemapTileJSONImpl ::
  EffectFn3 String String PhaserScene PhaserScene

loadTilemapTileJSON :: String -> String -> PhaserScene -> Effect PhaserScene
loadTilemapTileJSON = runEffectFn3 loadTilemapTileJSONImpl
