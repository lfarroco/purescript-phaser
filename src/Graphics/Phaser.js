'use strict';

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

exports.addSceneImpl = function (
  { key, init, create, update, preload, state },
  autoStart,
  game
) {
  const config = {
    init: function (data_) {
      init(this)(data_)();
    },
    preload: function () {
      preload(this)();
    },
    create: function (data_) {
      create(this)(data_)();
    },
    update: function () {
      update(this)();
    },
  };
  game.scene.add(key, config, autoStart, state);
  return game;
};
