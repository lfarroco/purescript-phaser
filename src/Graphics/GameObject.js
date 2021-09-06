'use strict';

exports.destroyImpl = function (obj) {
  obj.destroy();
  return {};
};

exports.getPositionImpl = function ({ x, y }) {
  return { x, y };
};
exports.setPositionImpl = function ({ x, y }, obj) {
  obj.setPosition(x, y);
  return obj;
};
exports.getAngleImpl = function (obj) {
  return obj.angle;
};
exports.setAngleImpl = function (degrees, obj) {
  obj.setAngle(degrees);
  return obj;
};
exports.getRadiansImpl = function (obj) {
  return obj.radians;
};
exports.setRadiansImpl = function (radians, obj) {
  obj.setRadians(radians);
  return obj;
};
exports.getVisibleImpl = function (obj) {
  return obj.visible;
};
exports.setVisibleImpl = function (visible, obj) {
  obj.setVisible(visible);
  return obj;
};

exports.getAlphaImpl = function (obj) {
  return obj.alpha;
};
exports.setAlphaImpl = function (value, obj) {
  obj.setAlpha(value);
  return obj;
};

exports.setTintImpl = function (value, obj) {
  obj.setTint(value);
  return obj;
};
exports.clearTintImpl = function (obj) {
  obj.clearTint();
  return obj;
};

exports.getSizeImpl = function ({ width, height }) {
  return { width, height };
};
exports.setSizeImpl = function ({ width, height }, obj) {
  obj.setSize(width, height);
  return obj;
};

exports.getDisplaySizeImpl = function ({ displayWidth, displayHeight }) {
  return { width: displayWidth, height: displayHeight };
};
exports.setDisplaySizeImpl = ({ width, height }, obj) => {
  obj.setDisplaySize(width, height);
  return obj;
};

exports.getOriginImpl = ({ originX, originY }) => ({ x: originX, y: originY });

exports.setOriginImpl = ({ x, y }, obj) => {
  obj.setOrigin(x, y);
  return obj;
};

exports.getScaleImpl = ({ scaleX, scaleY }) => ({ x: scaleX, y: scaleY });

exports.setScaleImpl = function ({ x, y }, obj) {
  obj.setScale(x, y);
  return obj;
};

exports.getNameImpl = ({ name }) => name;
exports.setNameImpl = (name, obj) => {
  obj.setName(name);
  return obj;
};

exports.onClickImpl = (handler, obj) => {
  obj
    .setInteractive()
    .on('pointerdown', (pointer, localX, localY, event) =>
      handler(pointer)({ x: localX, y: localY })(event)(obj)()
    );
  return obj;
};

exports.getSceneImpl = (obj) => obj.scene;
