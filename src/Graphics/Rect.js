'use strict';

exports.solidColorRect = function({x, y}) {
  return function({width, height}) {
    return function(color) {
      return function(scene) {
        return function() {
          const btn = scene.add.graphics();

          btn.fillStyle(color, 1);

          //btn.lineStyle(2, 0xcdc0b7, 1);

          btn.fillRect(x, y, width, height);
          return btn;
        };
      };
    };
  };
};

exports.gradientRect = function({x, y}) {
  return function({width, height}) {
    return function({topLeft, topRight, bottomLeft, bottomRight}) {
      return function(scene) {
        return function() {
          const btn = scene.add.graphics();

          btn.fillGradientStyle(topLeft, topRight, bottomLeft, bottomRight, 1);

          btn.fillRect(x, y, width, height);
          return btn;
        };
      };
    };
  };
};
