"use strict";

// TODO: put this in a `util` module
function mapThis(obj) {
  var newObj = {};
  for (const key in obj) {
    if (obj.hasOwnProperty(key)) {
      newObj[key.toString()] = function () {
        obj[key](this)();
      };
    }
  }
  return newObj;
}

exports.createImpl = function (config) {
  if (config.scene != undefined) {
    config.scene = mapThis(config.scene);
  }
  return new Phaser.Game(config);
};

exports.setGameDimensionsImpl = function ({ width, height }, game) {
  game.config.width = width;
  game.config.height = height;
  return game;
};
