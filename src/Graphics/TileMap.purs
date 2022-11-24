module Graphics.Phaser.TileMap where

import Prelude
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, null, toMaybe)
import Data.Options (Options, options)
import Effect (Effect)
import Graphics.Canvas (Dimensions)
import Graphics.Phaser.CoreTypes (Vector)
import Graphics.Phaser.ForeignTypes (PhaserCamera, PhaserImage, PhaserLayer, PhaserLayerData, PhaserMapData, PhaserScene, PhaserTile, PhaserTileMap, PhaserTileSet, PhaserTiledObject, PhaserTilemapObjectLayer, PhaserTiledObjectProperty)
import Internal.Utils (_opt)
import Utils.FFI (_getProp, _method0, _method2, _return0, _return1, _return2, _return4, _return5)

data TilemapConfig

-- Docs: https://newdocs.phaser.io/docs/3.55.2/Phaser.Types.Tilemaps.TilemapConfig
tilemapConfig ::
  { key :: String -> Options TilemapConfig
  , data :: Array (Array Int) -> Options TilemapConfig
  , tileWidth :: Int -> Options TilemapConfig
  , tileHeight :: Int -> Options TilemapConfig
  , width :: Int -> Options TilemapConfig
  , height :: Int -> Options TilemapConfig
  , insertNull :: Boolean -> Options TilemapConfig
  }
tilemapConfig =
  { key: _opt "key"
  , data: _opt "data"
  , tileWidth: _opt "tileWidth"
  , tileHeight: _opt "tileHeight"
  , width: _opt "width"
  , height: _opt "height"
  , insertNull: _opt "insertNull"
  }

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

makeTileMap :: Options TilemapConfig -> PhaserScene -> Effect PhaserTileMap
makeTileMap config = _getProp "make" >=> _return1 "tilemap" (options config)

addTilesetImage :: String -> String -> PhaserTileMap -> Effect PhaserTileSet
addTilesetImage = _return2 "addTilesetImage"

setTileSize :: Dimensions -> PhaserTileSet -> Effect PhaserTileSet
setTileSize dims = _method2 "setTileSize" dims.width dims.height

createLayer ::
  String ->
  Array PhaserTileSet ->
  PhaserTileMap ->
  Effect PhaserLayer
createLayer = _return2 "createLayer"

getLayerTilemap :: PhaserLayer -> Effect PhaserTileMap
getLayerTilemap = _getProp "tilemap"

tilesets :: PhaserTileMap -> Effect (Array PhaserTileSet)
tilesets = _getProp "tilesets"

currentLayerIndex :: PhaserTileMap -> Effect Number
currentLayerIndex = _getProp "currentLayerIndex"

format :: PhaserTileMap -> Effect Number
format = _getProp "format"

height :: PhaserTileMap -> Effect Number
height = _getProp "height"

heightInPixels :: PhaserTileMap -> Effect Number
heightInPixels = _getProp "heightInPixels"

hexSideLength :: PhaserTileMap -> Effect Number
hexSideLength = _getProp "hexSideLength"

-- missing
-- imageCollections
-- images
layer :: PhaserTileMap -> Effect PhaserLayerData
layer = _getProp "layer"

layers :: PhaserTileMap -> Effect (Array PhaserLayerData)
layers = _getProp "layers"

getLayer :: String -> PhaserTileMap -> Effect (Maybe PhaserLayerData)
getLayer key tilemap = do
  (layer' :: Nullable PhaserLayerData) <- _return1 "getLayer" key tilemap
  pure $ toMaybe layer'

getObjectLayer :: String -> PhaserTileMap -> Effect (Maybe PhaserTilemapObjectLayer)
getObjectLayer key tilemap = do
  (layer' :: Nullable PhaserTilemapObjectLayer) <- _return1 "getObjectLayer" key tilemap
  pure $ toMaybe layer'

objects :: PhaserTileMap -> Effect (Array PhaserTilemapObjectLayer)
objects = _getProp "objects"

orientation :: PhaserTileMap -> Effect String
orientation = _getProp "orientation"

properties :: forall a. PhaserTileMap -> Effect a
properties = _getProp "properties"

renderOrder :: PhaserTileMap -> Effect String
renderOrder = _getProp "renderOrder"

scene :: PhaserTileMap -> Effect PhaserScene
scene = _getProp "scene"

tileHeight :: PhaserTileMap -> Effect Number
tileHeight = _getProp "tileHeight"

tileWidth :: PhaserTileMap -> Effect Number
tileWidth = _getProp "tileWidth"

version :: PhaserTileMap -> Effect Number
version = _getProp "version"

width :: PhaserTileMap -> Effect Number
width = _getProp "width"

widthInPixels :: PhaserTileMap -> Effect Number
widthInPixels = _getProp "widthInPixels"

calculateFacesAt :: { x :: Int, y :: Int } -> PhaserTileMap -> Effect PhaserTileMap
calculateFacesAt { x, y } = _method2 "calculateFacesAt" x y

calculateFacesWithin :: PhaserTileMap -> Effect PhaserTileMap
calculateFacesWithin = _method0 "calculateFacesWithin"

getTileAt :: { x :: Int, y :: Int } -> Boolean -> String -> PhaserTileMap -> Effect (Maybe PhaserTile)
getTileAt { x, y } notNull layerKey tilemap = do
  (nullableTile :: Nullable PhaserTile) <- _return4 "getTileAt" x y notNull layerKey tilemap
  pure $ toMaybe nullableTile

getTileAtWorldXY :: { x :: Number, y :: Number } -> Boolean -> String -> PhaserTileMap -> Effect (Maybe PhaserTile)
getTileAtWorldXY { x, y } notNull layerKey tilemap = do
  (nullableTile :: Nullable PhaserTile) <- _return5 "getTileAtWorldXY" x y notNull null layerKey tilemap
  pure $ toMaybe nullableTile

getTileAtWorldXYWithCamera :: { x :: Number, y :: Number } -> Boolean -> String -> PhaserCamera -> PhaserTileMap -> Effect (Maybe PhaserTile)
getTileAtWorldXYWithCamera { x, y } notNull layerKey camera tilemap = do
  (nullableTile :: Nullable PhaserTile) <- _return5 "getTileAtWorldXY" x y notNull camera layerKey tilemap
  pure $ toMaybe nullableTile

getTileX :: PhaserTile -> Effect Int
getTileX = _getProp "x"

getTileY :: PhaserTile -> Effect Int
getTileY = _getProp "y"

getCenterX :: PhaserTile -> Effect Number
getCenterX = _return0 "getCenterX"

getCenterY :: PhaserTile -> Effect Number
getCenterY = _return0 "getCenterY"

-- PhaserTilemapObjectLayer  https://photonstorm.github.io/phaser3-docs/Phaser.Tilemaps.ObjectLayer.html#objects__anchor
getObjects :: PhaserTilemapObjectLayer -> Effect (Array PhaserTiledObject)
getObjects = _getProp "objects"

-- TiledObject https://photonstorm.github.io/phaser3-docs/Phaser.Types.Tilemaps.html#.TiledObject__anchor
getId :: PhaserTiledObject -> Effect Number
getId = _getProp "id"

getName :: PhaserTiledObject -> Effect String
getName = _getProp "name"

getType :: PhaserTiledObject -> Effect String
getType = _getProp "type"

getX :: PhaserTiledObject -> Effect Number
getX = _getProp "x"

getY :: PhaserTiledObject -> Effect Number
getY = _getProp "y"

getWidth :: PhaserTiledObject -> Effect Number
getWidth = _getProp "width"

getHeight :: PhaserTiledObject -> Effect Number
getHeight = _getProp "height"

getRotation :: PhaserTiledObject -> Effect Number
getRotation = _getProp "rotation"

getProperties :: PhaserTiledObject -> Effect (Array PhaserTiledObjectProperty)
getProperties = _getProp "properties"

getGid :: PhaserTiledObject -> Effect Number
getGid = _getProp "gid"

getFlippedHorizontal :: PhaserTiledObject -> Effect Boolean
getFlippedHorizontal = _getProp "flippedHorizontal"

getFlippedVertical :: PhaserTiledObject -> Effect Boolean
getFlippedVertical = _getProp "flippedVertical"

getFlippedAntiDiagonal :: PhaserTiledObject -> Effect Boolean
getFlippedAntiDiagonal = _getProp "flippedAntiDiagonal"

getPolyline :: PhaserTiledObject -> Effect (Array Vector)
getPolyline = _getProp "polyline"

getPoligon :: PhaserTiledObject -> Effect (Array Vector)
getPoligon = _getProp "polygon"

getText :: forall a. PhaserTiledObject -> Effect a
getText = _getProp "ext"

getRectangle :: PhaserTiledObject -> Effect Boolean
getRectangle = _getProp "rectangle"

getEllipse :: PhaserTiledObject -> Effect Boolean
getEllipse = _getProp "ellipse"

getPoint :: PhaserTiledObject -> Effect Boolean
getPoint = _getProp "point"

getPropertyName :: PhaserTiledObjectProperty -> Effect String
getPropertyName = _getProp "name"

getPropertyType :: PhaserTiledObjectProperty -> Effect String
getPropertyType = _getProp "type"

getPropertyValue :: forall a. PhaserTiledObjectProperty -> Effect a
getPropertyValue = _getProp "value"
