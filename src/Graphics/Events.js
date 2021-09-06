'use strict';

exports.createEmitterImpl = function () {
  return new Phaser.Events.EventEmitter();
};

exports.onImpl = function (key, handler, emitter) {
  emitter.on(key, (arg) => handler(arg)());
};

exports.onceImpl = function (key, handler, emitter) {
  emitter.once(key, (arg) => handler(arg)());
};

exports.offImpl = function (key, emitter) {
  emitter.off(key);
};

exports.emitImpl = function (key, arg, emitter) {
  emitter.emit(key, arg);
};

exports.destroyEmitterImpl = function (emitter) {
  emitter.destroy();
};

exports.createSceneListenerImpl = function (key, handler, scene) {
  scene.events.on(key, (arg) => handler(arg)());
};

exports.emitSceneEventImpl = function (key, arg, scene) {
  scene.events.emit(key, arg);
};
