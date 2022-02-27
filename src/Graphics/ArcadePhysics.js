"use strict";
exports.createStaticGroupImpl = (scene) => {
  const group = scene.physics.add.staticGroup();

  return group;
};

exports.createArcadeImageImpl = (scene, { x, y }, texture) =>
  scene.physics.add.image(x, y, texture);
