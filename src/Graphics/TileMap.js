'use strict';

exports.makeTileMapImpl = (
  scene,
  {
    key,
    data,
    tileWidth,
    tileHeight,
  }) =>
  scene.make.tilemap(({
    key,
    data,
    tileWidth,
    tileHeight,
  }));

exports.addTilesetImageImpl = function (
  tileMap,
  tilesetName,
  { key, tileWidth, tileHeight, tileMargin, tileSpacing, gid }
) {
  var tsi = tileMap.addTilesetImage(
    tilesetName,
    key, tileWidth, tileHeight, tileMargin, tileSpacing, gid
  );
  console.log(tsi);
  return tsi;
};

exports.createLayerImpl = (tileMap, layerID, tileset) =>
  tileMap.createLayer(layerID, tileset);

exports.loadTilemapTileJSONImpl = (key, path, scene) => {
  scene.load.tilemapTileJSON(key, path);
  return scene;
};

exports.tilesets = (tileMap) =>
  tileMap.tilesets;