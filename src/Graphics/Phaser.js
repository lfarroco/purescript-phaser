'use strict';

exports.createGame = function(config) {
  return function() {
    return new Phaser.Game(config);
  };
};

exports.getSceneManager = function (game) {
  return function () {
    return game.scene;
  };
};

exports.addSceneImpl = function (key, scene, autoStart, data, game) {
  return function () {
    game.scene.add(key, scene, autoStart, data);
    return game
  };
};
