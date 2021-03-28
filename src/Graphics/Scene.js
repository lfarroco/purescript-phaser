"use strict";

exports.getSceneManager = function (game) {
  return function () {
    return game.scene;
  };
};

exports.addScene = function ({
  key,
  init,
  create,
  update,
  preload,
  autoStart,
  sceneManager,
  data,
}) {
  return function () {
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
    sceneManager.add(key, config, autoStart, data);
    return {};
  };
};
exports.setEvent_ = function (on) {
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
exports.startImpl = function (scene, data) {
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
