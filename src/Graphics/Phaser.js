'use strict';

exports.createGame = function(config) {
  return function() {
    return new Phaser.Game(config);
  };
};
