-- | This is a direct translation of the example at
-- | https://github.com/photonstorm/phaser3-examples/blob/master/public/src/tilemap/create%20from%20array.js
-- | 

module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Graphics.Phaser (addScene)
import Graphics.Phaser as Phaser
import Graphics.Phaser.GameObject (Dimensions, OnClickCallback, getScene, onClick, setAngle, setDisplaySize)
import Graphics.Phaser.Image as Image
import Graphics.Phaser.Loader (loadImages)
import Graphics.Phaser.Scene (SceneConfig, defaultSceneConfig)
import Graphics.Phaser.Scene as Scene
import Graphics.Phaser.TileMap (addTilesetImage, createLayer, makeTileMap)
import Phaser.Graphics.ForeignTypes (PhaserGame, PhaserImage, PhaserScene, PhaserTileSet)

main :: Effect Unit
main = do
  _ <- runGame { width: 1060, height: 1060 }
  pure unit

runGame :: Dimensions -> Effect PhaserGame
runGame = Phaser.create
  >=> addScene mainScene true

tileName :: String
tileName = "mario-tiles"

mainScene :: SceneConfig {}
mainScene = defaultSceneConfig
  -- Use record update syntax to change relevant defaults
  { key = "main"
  , create = create
  , preload = loadImages
      [ { key: tileName
        , path: "./assets/super-mario.png"
        }
      ]
  }
  
type State = {}

create :: PhaserScene -> State -> Effect Unit
create scene _state = do
  -- When loading from an array, make sure to specify the
  -- tileWidth and tileHeight
  map <- makeTileMap
    -- Create a new record instead of updating a default one.
    { data: level
    , scene: scene
    , tileHeight: 16
    , tileWidth: 16
    }
    -- Note about purescript: Accidentally using record update syntax here
    -- ('=' instead of ':') gives a weird error "Could not match Record
    -- with Function"
  tiles <- addTilesetImage
    { name: tileName
    , tileMap: map
    , tileWidth: 16
    , tileHeight: 16
    }
  -- Another note: Forgetting to give a record as an argument to an effectful
  -- function also gives a weird error "Could not match Effect with Function"
  -- Currently defaulting layerID, x, and y to zeros.
  layer <- createLayer
    { tileMap: map
    , tilesets: [ tiles ]
    }
  -- fillLayer
  pure unit
  where
    -- Load a map from a 2D array of tile indices
    level :: Array (Array Int)
    level =
      [ [  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ]
      , [  0,  1,  2,  3,  0,  0,  0,  1,  2,  3,  0 ]
      , [  0,  5,  6,  7,  0,  0,  0,  5,  6,  7,  0 ]
      , [  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ]
      , [  0,  0,  0, 14, 13, 14,  0,  0,  0,  0,  0 ]
      , [  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ]
      , [  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ]
      , [  0,  0, 14, 14, 14, 14, 14,  0,  0,  0, 15 ]
      , [  0,  0,  0,  0,  0,  0,  0,  0,  0, 15, 15 ]
      , [ 35, 36, 37,  0,  0,  0,  0,  0, 15, 15, 15 ]
      , [ 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39 ]
      ]
