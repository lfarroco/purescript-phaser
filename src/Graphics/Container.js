"use strict";

exports.createImpl = function ({ x, y }, scene) {
  return function () {
    return scene.add.container(x, y);
  };
};

exports.addChildImpl = function (container, element) {
  return function () {
    container.add(element);
    return container;
  };
};

exports.removeChildren = function (container) {
  return function () {
    container.removeAll(true);
    return container;
  };
};

exports.listImpl = function (container) {
  return function () {
    return container.list;
  };
};
