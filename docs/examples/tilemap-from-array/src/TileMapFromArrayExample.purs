-- | This is a direct translation of the example at
-- | https://github.com/photonstorm/phaser3-examples/blob/master/public/src/tilemap/create%20from%20array.js
-- | 
module Main where

import Prelude
import Data.Array (length)
import Effect (Effect)
import Effect.Console (log)
import Graphics.Phaser as Phaser
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserScene)
import Graphics.Phaser.Loader (loadImage)
import Graphics.Phaser.Scene as Scene
import Graphics.Phaser.TileMap (addTilesetImage, createLayer, makeTileMap, tilesets)

tileName :: String
tileName = "mario-tiles"

tileMapKey :: String
tileMapKey = "tile map 1"

mainSceneKey :: String
mainSceneKey = "main key"

main :: Effect PhaserGame
main = do
  scene <- mainScene
  Phaser.createWithConfig
    ( (Phaser.config.width (16.0 * 11.0))
        <> (Phaser.config.height (16.0 * 11.0))
        <> (Phaser.config.scene [ scene ])
    )

mainScene :: Effect PhaserScene
mainScene =
  do
    Scene.newScene "main"
    >>= Scene.create create
    >>= Scene.preload preload

preload :: PhaserScene -> Effect PhaserScene
preload =
  loadImage
    { key: tileName
    , path: "assets/super-mario.png"
    }

create :: PhaserScene -> Effect PhaserScene
create scene = do
  log $ "create"
  -- When loading from an array, make sure to specify the
  -- tileWidth and tileHeight
  tileMap <-
    makeTileMap
      -- Create a new record instead of updating a default one.
      { key: tileMapKey
      , data: level
      , tileHeight: 16
      , tileWidth: 16
      , width: 16 * 11
      , height: 16 * 11
      , insertNull: false
      }
      scene
  -- Note about purescript: Accidentally using record update syntax here
  -- ('=' instead of ':') gives a weird error "Could not match Record
  -- with Function"
  tileset <-
    addTilesetImage tileName
      { tileWidth: 16
      , tileHeight: 16
      , key: "mario-tiles"
      , tileMargin: 0
      , tileSpacing: 0
      , gid: 0
      }
      tileMap
  tilesetsList <- tilesets tileMap
  -- Another note: Forgetting to give a record as an argument to an effectful
  -- function also gives a weird error "Could not match Effect with Function"
  -- Currently defaulting layerID, x, and y to zeros.
  log $ "Found " <> show (length tilesetsList) <> " tileset"
  _layer <- createLayer "layer" [ tileset ] tileMap
  pure scene
  where
  -- Load a map from a 2D array of tile indices
  level :: Array (Array Int)
  level =
    [ [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
    , [ 0, 1, 2, 3, 0, 0, 0, 1, 2, 3, 0 ]
    , [ 0, 5, 6, 7, 0, 0, 0, 5, 6, 7, 0 ]
    , [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
    , [ 0, 0, 0, 14, 13, 14, 0, 0, 0, 0, 0 ]
    , [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
    , [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
    , [ 0, 0, 14, 14, 14, 14, 14, 0, 0, 0, 15 ]
    , [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15 ]
    , [ 35, 36, 37, 0, 0, 0, 0, 0, 15, 15, 15 ]
    , [ 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39 ]
    ]
