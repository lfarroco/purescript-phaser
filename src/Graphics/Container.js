'use strict';

exports.createImpl = function (scene) {
  return function () {
    return scene.add.container();
  };
};

exports.addChildImpl = function (element, container) {
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
