'use strict';

exports.setBaseUrlImpl = (url, scene) => {
  scene.load.setBaseUrl(url);
};

exports.setPathImpl = (path, scene) => {
  scene.load.setPath(path);
};

exports.loadImagesImpl = (images, scene) => {
  images.forEach(({ key, path }) => {
    scene.load.image(key, path);
  });
  return scene;
};

exports.loadAtlasImpl = (key, textureURL, atlasURL, scene) => {
  scene.load.atlas(key, textureURL, atlasURL);
  return scene;
};

exports.loadSpritesheetImpl = (key, textureURL, config, scene) => {
  scene.load.atlas(key, textureURL, config);
  return scene;
};

exports.loadPluginImpl = (key, url, scene) => {
  scene.load.plugin(key, url);
  return scene;
};

exports.loadScenePluginImpl = (key, url, sceneKey, scene) => {
  scene.load.scenePlugin({
    key,
    url,
    sceneKey,
  });
  return scene;
};

exports.onceLoadCompleteImpl = (scene, callback) => {
  scene.load.once(
    "complete",
    () => callback(scene)()
  );
  return scene;
};
