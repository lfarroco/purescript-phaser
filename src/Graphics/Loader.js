"use strict";

exports.setBaseUrl = function (url) {
  return function (scene) {
    return function () {
      scene.load.setBaseUrl(url);
    };
  };
};

exports.setPath = function (path) {
  return function (scene) {
    return function () {
      scene.load.setPath(path);
    };
  };
};

exports.loadImagesImpl = function (images, scene) {
  return function () {
    images.forEach(({ key, path }) => {
      scene.load.image(key, path);
    });
  };
};
exports.loadAtlas = function (key, textureURL, atlasURL, scene) {
  return function () {
    scene.load.atlas(key, textureURL, atlasURL);
  };
};

exports.loadSpritesheet = function (key, textureURL, frameWidth, frameHeight, frameCount) {
  return function () {
    scene.load.atlas(key, textureURL, atlasURL);
  };
};
