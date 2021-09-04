'use strict';

exports.setMainCameraBoundsImpl = ({ scene, x, y, width, height }) => {
  scene.cameras.main.setBounds(x, y, width, height);
  return scene;
};

exports.getMainCameraImpl = (scene) => {
  return scene.cameras.main;
};

exports.createSmoothedKeyControlImpl = (config) => {
  return new Phaser.Cameras.Controls.FixedKeyControl(config);
};

exports.updateCameraControlDeltaImpl = (control, delta) => {
  control.update(delta);
  return control;
};
