"use strict";

function create() {
  return new Phaser.Game();
}

exports.create = create;

exports.createWithConfigImpl = function (config) {
  return create(config);
};

exports.setGameDimensionsImpl = function ({ width, height }, game) {
  game.config.width = width;
  game.config.height = height;
  return game;
};
