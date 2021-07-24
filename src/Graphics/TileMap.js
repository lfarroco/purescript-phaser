'use strict';

exports.makeTileMap = function ({ scene, data, tileWidth, tileHeight }) {
  return () => {
    return scene.make.tilemap({ data, tileWidth, tileHeight });
  };
};

exports.addTilesetImage = function ({ tileMap, name, tileWidth, tileHeight }) {
  return () => {
    return tileMap.addTilesetImage(key, null, tileWidth, tileHeight);
  };
};

exports.createLayer = function ({ tileMap, tileset }) {
  return () => {
    return tileMap.createLayer(0, tileset, 0, 0);
  };
};

exports.loadTilemapTileJSONImpl = function (key, path, scene) {
  scene.load.tilemapTileJSON(key, path);
  return scene;
};
