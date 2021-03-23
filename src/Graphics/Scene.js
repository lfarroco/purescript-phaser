'use strict';

exports.getSceneManager = function(game) {
  return function() {
    return game.scene;
  };
};

exports.addScene = function(name) {
  return function({init, create, update, preload}) {
    return function(autostart) {
      return function(sceneManager) {
        return function(data) {
          return function() {
            const config = {
              init: function(data_) {
                init(this)(data_)();
              },
              preload: function() {
                preload(this)();
              },
              create: function(data_) {
                create(this)(data_)();
              },
              update: function() {
                update(this)();
              },
            };
            sceneManager.add(name, config, autostart, data);
            return {};
          };
        };
      };
    };
  };
};
exports.setEvent_ = function(on) {
  return function(callback) {
    return function(scene) {
      return function() {
        scene.on(on, () => callback()());
      };
    };
  };
};

exports.setTimedEvent = function(on) {
  return function(callback) {
    return function(scene) {
      return function() {
        scene.on(on, (time, delta) => callback(time)(delta)());
      };
    };
  };
};

exports.setGameObjectEvent = function(on) {
  return function(callback) {
    return function(scene) {
      return function() {
        scene.on(on, (gameObject, scene) => callback(gameObject)(scene)());
      };
    };
  };
};

exports.removeScene = function(sceneManager) {
  return function(key) {
    return function() {
      sceneManager.remove(key);
      return {};
    };
  };
};
