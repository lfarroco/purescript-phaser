'use strict';

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

    return scene;
  };
};
exports.loadAtlasImpl = function (key, textureURL, atlasURL, scene) {
  return function () {
    scene.load.atlas(key, textureURL, atlasURL);

    return scene;
  };
};

exports.loadSpritesheetImpl = function (key, textureURL, config, scene) {
  return function () {
    scene.load.spritesheet(key, textureURL, config);

    return scene;
  };
};

exports.loadPluginImpl = function (key, url, scene) {
  return function () {
    scene.load.plugin(key, url);
    return scene;
  };
};

exports.loadScenePluginImpl = function (key, url, sceneKey, scene) {
  return function () {
    scene.load.scenePlugin({
      key,
      url,
      sceneKey,
    });
    return scene;
  };
};

exports.onceLoadCompleteImpl = function (scene, callback) {
  return function () {
    scene.load.once('complete', function () {
      callback(scene)();
    });

    return scene;
  };
};
