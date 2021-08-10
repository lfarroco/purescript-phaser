'use strict';

exports.makeTileMapImpl = (scene, data, { tileWidth, tileHeight }) =>
  scene.make.tilemap({ data, tileWidth, tileHeight });

exports.addTilesetImageImpl = (tileMap, tilesetName, { key, tileWidth, tileHeight, tileMargin, tileSpacing, gid }) =>
  tileMap.addTilesetImage(tilesetName, key, tileWidth, tileHeight, tileMargin, tileSpacing, gid);

exports.createLayerImpl = (tileMap, layerID, tileset, { x, y }) =>
  tileMap.createLayer(layerID, tileset, x, y);

exports.loadTilemapTileJSONImpl = (key, path, scene) => {
  scene.load.tilemapTileJSON(key, path);
  return scene;
};
