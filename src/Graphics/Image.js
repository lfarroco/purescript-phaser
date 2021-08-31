"use strict";

exports.createImpl = (textureKey, { x, y }, scene) =>
  scene.add.image(x, y, textureKey);

exports.getSceneImpl = (img) =>
  img.scene;

