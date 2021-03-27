"use strict";

exports.destroyImpl = function (obj) {
  return function () {
    obj.destroy();
    return {};
  };
};

exports.getPositionImpl = function ({x,y}) {
  return function () {
    return {x,y};
  };
};
exports.setPositionImpl = function (obj, pos) {
  return function () {
    obj.setPosition(pos);
    return {};
  };
};
exports.getAngleImpl = function (obj) {
  return function () {
    return obj.angle;
  };
};
exports.setAngleImpl = function (obj, degrees) {
  return function () {
    obj.setAngle(degrees);
    return {};
  };
};
exports.getRadiansImpl = function (obj) {
  return function () {
    return obj.radians;
  };
};
exports.setRadiansImpl = function (obj, radians) {
  return function () {
    obj.setRadians(radians);
    return {};
  };
};
exports.getVisibleImpl = function (obj) {
  return function () {
    return obj.visible;
  };
};
exports.setVisibleImpl = function (obj, visible) {
  return function () {
    obj.setVisible(visible);
    return {};
  };
};

exports.getAlphaImpl = function (obj) {
  return function () {
    return obj.alpha;
  };
};
exports.setAlphaImpl = function (obj, value) {
  return function () {
    obj.setAlpha(value);
    return {};
  };
};

exports.setTintImpl = function (obj, value) {
  return function () {
    obj.setTint(value);
    return {};
  };
};
exports.clearTintImpl = function (obj) {
  return function () {
    obj.clearTint();
    return {};
  };
};

exports.getSizeImpl = function ({ width, height }) {
  return function () {
    return { width, height };
  };
};
exports.setSizeImpl = function (obj, { width, height }) {
  return function () {
    obj.setSize(width, height);
    return {};
  };
};

exports.getDisplaySizeImpl = function ({ displayWidth, displayHeight }) {
  return function () {
    return { width: displayWidth, height: displayHeight };
  };
};
exports.setDisplaySizeImpl = function (obj, { width, height }) {
  return function () {
    obj.setDisplaySize(width, height);
    return {};
  };
};

exports.getOriginImpl = function ({ originX, originY }) {
  return function () {
    return { x: originX, y: originY };
  };
};
exports.setOriginImpl = function (obj, { x, y }) {
  return function () {
    obj.setOrigin(x, y);
    return {};
  };
};

exports.getScaleImpl = function ({ scaleX, scaleY }) {
  return function () {
    return { x: scaleX, y: scaleY };
  };
};
exports.setScaleImpl = function (obj, { x, y }) {
  return function () {
    obj.setScale(x, y);
    return {};
  };
};
exports.getNameImpl = function ({ name }) {
  return function () {
    return name;
  };
};
exports.setNameImpl = function (obj, name) {
  return function () {
    obj.setName(name);
    return {};
  };
};

exports.onClickImpl = function (obj, handler) {
  return function () {
    obj.setInteractive().on("pointerdown", (pointer, localX, localY, event) => {
      handler(pointer)({ x: localX, y: localY })(event)();
    });
  };
};
