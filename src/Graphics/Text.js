"use strict";

exports.createImpl = function ({ pos, text, config }, scene) {
  return function () {
    return scene.add.text(pos.x, pos.y, text, config);
  };
};
