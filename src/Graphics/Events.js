"use strict";

exports.createEmitter = function () {
  return function () {
    return new Phaser.Events.EventEmitter();
  };
};

exports.on = function (key) {
  return function (handler) {
    return function (emitter) {
      return function () {
        emitter.on(key, (arg) => handler(arg)());
      };
    };
  };
};

exports.emit = function (key) {
  return function (arg) {
    return function (emitter) {
      return function () {
        emitter.emit(key, arg);
      };
    };
  };
};

exports.destroyEmitter = function (emitter) {
  return function () {
    emitter.destroy();
  };
};

exports.createSceneListener_ = function (key) {
  return function (handler) {
    return function (scene) {
      return function () {
        scene.events.on(key, (arg) => handler(arg)());
      };
    };
  };
};

exports.emitSceneEvent = function (key) {
  return function (arg) {
    return function (scene) {
      return function () {
        scene.events.emit(key, arg);
      };
    };
  };
};
