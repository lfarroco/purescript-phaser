'use strict';

// https://photonstorm.github.io/phaser3-docs/Phaser.GameObjects.Graphics.html

exports.createImpl = function (scene) {
  return scene.add.graphics();
};

exports.rectangleImpl = function (scene) {
  return scene.add.rectangle();
};

exports.fillStyleImpl = function (color, alpha, graphic) {
  graphic.fillStyle(color, alpha);
  return graphic;
};

exports.fillRectImpl = function ({ x, y }, { width, height }, graphic) {
  graphic.fillRect(x, y, width, height);
  return graphic;
};

exports.strokeRectImpl = function ({ x, y }, { width, height }, graphic) {
  graphic.strokeRect(x, y, width, height);
  return graphic;
};

exports.strokeRoundedRectImpl = function (
  { x, y },
  { width, height },
  radius,
  graphic
) {
  graphic.strokeRoundedRect(x, y, width, height, radius);
  return graphic;
};

exports.lineStyleImpl = function ({ width, color, alpha }, graphic) {
  graphic.lineStyle(width, color, alpha);
  return graphic;
};
exports.clearImpl = function (graphic) {
  graphic.clear();
  return graphic;
};
exports.beginPathImpl = function (graphic) {
  graphic.beginPath();
  return graphic;
};

exports.moveToImpl = function ({ x, y }, graphic) {
  graphic.moveTo(x, y);
  return graphic;
};

exports.lineToImpl = function ({ x, y }, graphic) {
  graphic.lineTo(x, y);
  return graphic;
};

exports.closePathImpl = function (graphic) {
  graphic.closePath();
  return graphic;
};

exports.strokePathImpl = function (graphic) {
  graphic.strokePath();
  return graphic;
};

exports.fillGradientStyleImpl = function (
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  graphic
) {
  graphic.fillGradientStyle(topLeft, topRight, bottomLeft, bottomRight);
  return graphic;
};
