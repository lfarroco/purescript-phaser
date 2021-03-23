'use strict';

exports.addContainer = function({x, y}) {
  return function(scene) {
    return function() {
      return scene.add.container(x, y);
    };
  };
};
exports.setContainerSize = function({width, height}) {
  return function(container) {
    return function() {
      container.setSize(width, height);
      return {};
    };
  };
};

exports.addToContainer = function(container) {
  return function(element) {
    return function() {
      container.add(element);
      return {};
    };
  };
};

exports.removeChildren = function(container) {
  return function() {
    container.removeAll(true);
    return {};
  };
};
