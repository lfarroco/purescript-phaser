'use strict';

exports.createImpl = function (scene) {
  return scene.add.container();
};

exports.addChildImpl = function (element, container) {
  container.add(element);
  return container;
};

exports.removeChildrenImpl = function (container) {
  container.removeAll(true);
  return container;
};

exports.listImpl = function (container) {
  return container.list;
};
