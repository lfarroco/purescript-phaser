"use strict";

exports.makeTileMap = function ({ scene, data, tileWidth, tileHeight }) {
  return () => {
    return scene.make.tilemap({ data, tileWidth, tileHeight });
  };
};

exports.addTilesetImage = function ({ tileMap, key, tileWidth, tileHeight }) {
  return () => {
    console.log(`....`, key);
    return tileMap.addTilesetImage(key, null, tileWidth, tileHeight);
  };
};

exports.createLayer = function ({ tileMap, tileset }) {
  return () => {
    return tileMap.createLayer(0, tileset, 0, 0);
  };
};
