"use strict";

// TODO: put this in a `util` module
function mapThis(obj) {
  var newObj = {};
  for (const key in obj) {
    if (obj.hasOwnProperty(key)) {
      newObj[key.toString()] = function () {
        obj[key](this)();
      };
    }
  }
  return newObj;
}

exports.addSceneImpl = function (key, sceneConfig, autoStart, game) {
  // Map only the existing fields into calls taking `this` which is the
  // PhaserScene.
  // TODO: replace with `mkEffectFn1`
  return game.scene.add(key, mapThis(sceneConfig), autoStart);
};


exports.getSceneManagerImpl = function (obj) {
  return obj.scene;
};
