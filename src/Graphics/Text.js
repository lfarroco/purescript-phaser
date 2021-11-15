"use strict";

exports.createImpl = function (text, scene) {
  return scene.add.text(0, 0, text);
};

exports.setTextImpl = function (value, text) {
  text.setText(value);
  return text;
};

exports.setStyleImpl = function (value, text) {
  text.setStyle(value);
  return text;
};

exports.setColorImpl = function (value, text) {
  text.setColor(value);
  return text;
};

exports.setFontImpl = function (value, text) {
  text.setFont(value);
  return text;
};

exports.setFontFamilyImpl = function (value, text) {
  text.setFontFamily(value);
  return text;
};

exports.setFontSizeImpl = function (value, text) {
  text.setFontSize(value);
  return text;
};

exports.setFontStyleImpl = function (value, text) {
  text.setFontStyle(value);
  return text;
};

exports.setLineSpacingImpl = function (value, text) {
  text.setLineSpacing(value);
  return text;
};

exports.setMaxLinesImpl = function (value, text) {
  text.setMaxLines(value);
  return text;
};

exports.setPaddingImpl = function ({ left, top, right, bottom }, text) {
  text.setPadding(left, top, right, bottom);
  return text;
};

exports.setShadowImpl = function (text) {
  text.setShadow();
  return text;
};

exports.setShadowBlurImpl = function (value, text) {
  text.setShadowBlur(value);
  return text;
};

exports.setShadowColorImpl = function (value, text) {
  text.setShadowColor(value);
  return text;
};

exports.setShadowFillImpl = function (value, text) {
  text.setShadowFill(value);
  return text;
};

exports.setShadowOffsetImpl = function ({ x, y }, text) {
  text.setShadowOffset(x, y);
  return text;
};
exports.setShadowStrokeImpl = function (value, text) {
  text.setShadowStroke(value);
  return text;
};
exports.setStrokeImpl = function (value, text) {
  text.setStroke(value);
  return text;
};

exports.setShadowStrokeImpl = function (value, text) {
  text.setShadowStroke(value);
  return text;
};
exports.updateTextImpl = function (text) {
  text.updateText();
  return text;
};

exports.getTextMetrics = function (text) {
  return text.getTextMetrics();
};
