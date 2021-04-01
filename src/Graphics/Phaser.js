"use strict";

exports.createGame = function (config) {
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
  key,
  { init, create, update, preload },
  autoStart,
  model,
  game
) {
  return function () {

    let dataKey = "_scene_" + key
    const config = {
      init: function (data_) {
        init(this)(data_)();
      },
      preload: function () {
        preload(this)(model)();
      },
      create: function (data_) {
        create(this)(data_)();
      },
      update: function () {
        update(this)(game.registry.get(dataKey))();
      },
    };
    game.scene.add(key, config, autoStart, model);
    game.registry.set(dataKey, model);
    return game;
  };
};
