"use strict";

exports.setEventImpl = function (on) {
  return function (callback) {
    return function (scene) {
      return function () {
        scene.on(on, () => callback()());
      };
    };
  };
};

exports.setTimedEvent = function (on) {
  return function (callback) {
    return function (scene) {
      return function () {
        scene.on(on, (time, delta) => callback(time)(delta)());
      };
    };
  };
};

exports.getSceneManagerImpl = function (obj) {
  return function () {
    return obj.sceneManager;
  };
};

exports.setGameObjectEvent = function (on) {
  return function (callback) {
    return function (scene) {
      return function () {
        scene.on(on, (gameObject, scene) => callback(gameObject)(scene)());
      };
    };
  };
};

exports.remove = function (scene) {
  return function () {
    scene.scene.remove(scene);
    return {};
  };
};

exports.getByKeyImpl = function (sceneManager, key) {
  return function () {
    return sceneManager.getScene(key);
  };
};
exports.launchImpl = function (scene, data) {
  return function () {
    return scene.launch(data);
  };
};
exports.launchByKeyImpl = function (key, data, scene) {
  return function () {
    return scene.scene.launch(key, data);
  };
};
exports.startByKeyImpl = function (key, data, scene) {
  return function () {
    return scene.scene.start(key, data);
  };
};
exports.removeByKeyImpl = function (key, scene) {
  return function () {
    return scene.scene.remove(key);
  };
};
exports.startImpl = function (data, scene) {
  return function () {
    return scene.scene.start(scene, data);
  };
};
exports.restartImpl = function (scene, data) {
  return function () {
    return scene.scene.restart(scene, data);
  };
};
exports.pause = function (scene) {
  return function () {
    return scene.scene.pause(scene);
  };
};
exports.resume = function (scene) {
  return function () {
    return scene.scene.resume(scene);
  };
};
exports.sleep = function (scene) {
  return function () {
    return scene.scene.sleep(scene);
  };
};
exports.wake = function (scene) {
  return function () {
    return scene.scene.wake(scene);
  };
};
exports.switch = function (scene) {
  return function () {
    return scene.scene.switch(scene);
  };
};
exports.run = function (scene, data) {
  return function () {
    return scene.scene.run(scene, data);
  };
};
exports.stop = function (scene) {
  return function () {
    return scene.scene.stop(scene);
  };
};
exports.setVisible = function (scene) {
  return function () {
    return scene.setVisible();
  };
};
exports.bringToTop = function (sceneManager, name) {
  return function () {
    return sceneManager.bringToTop(name);
  };
};
exports.sendToBack = function (sceneManager, name) {
  return function () {
    return sceneManager.sendToBack(name);
  };
};

exports.getRegistryDataImpl = function (registry, key) {
  return function () {
    return registry.get(key);
  };
};
exports.setRegistryDataImpl = function (registry, key, data) {
  return function () {
    return registry.set(key, data);
  };
};
exports.getRegistryImpl = function (obj) {
  return function () {
    return obj.registry;
  };
};
exports.getDataImpl = function (key, obj) {
  return function () {
    return obj.data.get(key);
  };
};
exports.setDataImpl = function (key, data, obj) {
  return function () {
    return obj.data.set(key, data);
  };
};

exports.getPluginInstanceImpl = function (scene, key) {
  return function () {
    return scene[key];
  };
};
