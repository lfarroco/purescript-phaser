"use strict";

exports.addSceneImpl = function (
  { key, init, create, update, preload, autoStart },
  game
) {
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
  game.scene.add(key, config, autoStart);
  return game;
};

exports.setEventImpl = function (on, callback, scene) {
  scene.events.on(on, () => callback()());
  return scene;
};

exports.setTimedEvent = function (on, callback, scene) {
  scene.events.on(on, (time, delta) => callback(time)(delta)());
  return scene;
};

exports.getSceneManagerImpl = function (obj) {
  return obj.scene;
};

exports.setGameObjectEvent = function (on, callback, scene) {
  scene.on(on, (gameObject, scene) => callback(gameObject)(scene)());
  return scene;
};

exports.removeImpl = function (scene) {
  scene.scene.remove(scene);
  return {};
};

// TODO: return maybe
exports.getByKeyImpl = function (sceneManager, key) {
  return sceneManager.get(key);
};
exports.launchImpl = function (scene, data) {
  return scene.launch(data);
};
exports.launchByKeyImpl = function (key, data, scene) {
  return scene.scene.launch(key, data);
};

exports.startByKeyImpl = function (key, data, scene) {
  return scene.scene.start(key, data);
};

exports.removeByKeyImpl = function (key, scene) {
  return scene.scene.remove(key);
};

exports.startImpl = function (data, scene) {
  return scene.scene.start(scene, data);
};

exports.restartImpl = function (scene, data) {
  return scene.scene.restart(scene, data);
};

exports.pauseImpl = function (scene) {
  return scene.scene.pause(scene);
};

exports.resumeImpl = function (scene) {
  return scene.scene.resume(scene);
};

exports.sleepImpl = function (scene) {
  return scene.scene.sleep(scene);
};

exports.wakeImpl = function (scene) {
  return scene.scene.wake(scene);
};

exports.switchImpl = function (scene) {
  return scene.scene.switch(scene);
};

exports.runImpl = function (scene, data) {
  return scene.scene.run(scene, data);
};

exports.stopImpl = function (scene) {
  return scene.scene.stop(scene);
};

exports.setVisibleImpl = function (scene) {
  return scene.setVisible();
};

exports.bringToTopImpl = function (sceneManager, name) {
  return sceneManager.bringToTop(name);
};

exports.sendToBackImpl = function (sceneManager, name) {
  return sceneManager.sendToBack(name);
};

exports.getRegistryDataImpl = function (registry, key) {
  return registry.get(key);
};

exports.setRegistryDataImpl = function (registry, key, data) {
  return registry.set(key, data);
};

exports.getRegistryImpl = function (obj) {
  return obj.registry;
};

exports.getDataImpl = function (key, obj) {
  return obj.data.get(key);
};

exports.setDataImpl = function (key, data, obj) {
  return obj.data.set(key, data);
};

exports.getPluginInstanceImpl = function (scene, key) {
  return scene[key];
};
