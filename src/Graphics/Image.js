"use strict";

exports.create = function (textureKey) {
  return function ({ x, y }) {
    return function (scene) {
      return function () {
        return scene.add.image(x, y, textureKey);
      };
    };
  };
};
exports.getScene = function (img) {
  return function () {
    return img.scene;
  };
};

