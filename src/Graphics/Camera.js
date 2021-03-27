"use strict";

exports.setMainCameraBounds = ({ scene, x, y, width, height }) => {
  scene.cameras.main.setBounds(x, y, width, height);
  return {};
};
