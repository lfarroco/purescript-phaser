'use strict';

// https://photonstorm.github.io/phaser3-docs/Phaser.GameObjects.Graphics.html

exports.create = function (scene) {
  return function () {
    return scene.add.graphics();
  };
};

exports.rectangleImpl = function (scene) {
  return function () {
    return scene.add.rectangle();
  };
};

exports.fillStyleImpl = function (color, alpha, graphic) {
  return function () {
    graphic.fillStyle(color, alpha);
    return graphic;
  };
};

exports.fillRectImpl = function ({ x, y }, { width, height }, graphic) {
  return function () {
    graphic.fillRect(x, y, width, height);
    return graphic;
  };
};

exports.strokeRectImpl = function ({ x, y }, { width, height }, graphic) {
  return function () {
    graphic.strokeRect(x, y, width, height);
    return graphic;
  };
};

exports.strokeRoundedRectImpl = function (
  { x, y },
  { width, height },
  radius,
  graphic
) {
  return function () {
    graphic.strokeRoundedRect(x, y, width, height, radius);
    return graphic;
  };
};

exports.lineStyleImpl = function (width, color, alpha, graphic) {
  return function () {
    graphic.lineStyle(width, color, alpha);
    return graphic;
  };
};

exports.beginPath = function (graphic) {
  return function () {
    graphic.beginPath();
    return graphic;
  };
};

exports.moveToImpl = function ({ x, y }, graphic) {
  return function () {
    graphic.moveTo(x, y);
    return graphic;
  };
};

exports.lineToImpl = function ({ x, y }, graphic) {
  return function () {
    graphic.lineTo(x, y);
    return graphic;
  };
};

exports.closePath = function (graphic) {
  return function () {
    graphic.closePath();
    return graphic;
  };
};

exports.strokePath = function (graphic) {
  return function () {
    graphic.strokePath();
    return graphic;
  };
};

exports.fillGradientStyleImpl = function (
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  graphic
) {
  return function () {
    graphic.fillGradientStyle(topLeft, topRight, bottomLeft, bottomRight);
    return graphic;
  };
};
