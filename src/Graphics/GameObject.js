"use strict";

exports.destroyImpl = function (obj) {
  return function () {
    obj.destroy();
    return {};
  };
};

exports.getPositionImpl = function ({ x, y }) {
  return function () {
    return { x, y };
  };
};
exports.setPositionImpl = function ({ x, y }, obj) {
  return function () {
    obj.setPosition(x, y);
    return obj;
  };
};
exports.getAngleImpl = function (obj) {
  return function () {
    return obj.angle;
  };
};
exports.setAngleImpl = function (degrees, obj) {
  return function () {
    obj.setAngle(degrees);
    return obj;
  };
};
exports.getRadiansImpl = function (obj) {
  return function () {
    return obj.radians;
  };
};
exports.setRadiansImpl = function (radians, obj) {
  return function () {
    obj.setRadians(radians);
    return obj;
  };
};
exports.getVisibleImpl = function (obj) {
  return function () {
    return obj.visible;
  };
};
exports.setVisibleImpl = function (visible, obj) {
  return function () {
    obj.setVisible(visible);
    return obj;
  };
};

exports.getAlphaImpl = function (obj) {
  return function () {
    return obj.alpha;
  };
};
exports.setAlphaImpl = function (value, obj) {
  return function () {
    obj.setAlpha(value);
    return obj;
  };
};

exports.setTintImpl = function (value, obj) {
  return function () {
    obj.setTint(value);
    return obj;
  };
};
exports.clearTintImpl = function (obj) {
  return function () {
    obj.clearTint();
    return obj;
  };
};

exports.getSizeImpl = function ({ width, height }) {
  return function () {
    return { width, height };
  };
};
exports.setSizeImpl = function ({ width, height }, obj) {
  return function () {
    obj.setSize(width, height);
    return obj;
  };
};

exports.getDisplaySizeImpl = function ({ displayWidth, displayHeight }) {
  return function () {
    return { width: displayWidth, height: displayHeight };
  };
};
exports.setDisplaySizeImpl = function ({ width, height }, obj) {
  return function () {
    obj.setDisplaySize(width, height);
    return obj;
  };
};

exports.getOriginImpl = function ({ originX, originY }) {
  return function () {
    return { x: originX, y: originY };
  };
};
exports.setOriginImpl = function ({ x, y }, obj) {
  return function () {
    obj.setOrigin(x, y);
    return obj;
  };
};

exports.getScaleImpl = function ({ scaleX, scaleY }) {
  return function () {
    return { x: scaleX, y: scaleY };
  };
};
exports.setScaleImpl = function ({ x, y }, obj) {
  return function () {
    obj.setScale(x, y);
    return obj;
  };
};
exports.getNameImpl = function ({ name }) {
  return function () {
    return name;
  };
};
exports.setNameImpl = function (name, obj) {
  return function () {
    obj.setName(name);
    return obj;
  };
};

exports.onClickImpl = function (handler, obj) {
  return function () {
    obj.setInteractive().on("pointerdown", (pointer, localX, localY, event) => {
      handler(pointer)({ x: localX, y: localY })(event)(obj)();
    });
    return obj;
  };
};

exports.getSceneImpl = function (obj) {
  return function () {
    return obj.scene;
  };
};
