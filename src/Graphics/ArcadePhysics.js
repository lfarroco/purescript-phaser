"use strict";
exports.createStaticGroupImpl = (scene) => {
  const group = scene.physics.add.staticGroup();

  return group;
};
