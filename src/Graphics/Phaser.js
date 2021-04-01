"use strict";

exports.create = function (config) {
  return function () {
    return new Phaser.Game(config);
  };
};

exports.getSceneManager = function (game) {
  return function () {
    return game.scene;
  };
};

exports.addSceneImpl = function (
  { key, init, create, update, preload, state },
  autoStart,
  game
) {
  return function () {
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
};
