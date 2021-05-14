"use strict";

exports.setMainCameraBounds = ({ scene, x, y, width, height }) => {
  scene.cameras.main.setBounds(x, y, width, height);
  return scene;
};

exports.createSmoothedKeyControlImpl = (config) => {
  const controls = new Phaser.Cameras.Controls.SmoothedKeyControl(config);
  return controls;
};
exports.createSmoothedKeyControlImpl = (config) => {
  const controls = new Phaser.Cameras.Controls.FixedKeyControl(config);
  return controls;
};

exports.updateCameraControlDeltaImpl = (control, delta) => {
  control.update(delta);
  return control;
};

exports.getMainCamera = (scene) => {
  return scene.cameras.main
};
