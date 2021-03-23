'use strict';

exports.setBaseUrl = function(url) {
  return function(scene) {
    return function() {
      scene.load.setBaseUrl(url);
    };
  };
};

exports.setPath = function(path) {
  return function(scene) {
    return function() {
      scene.load.setPath(path);
    };
  };
};

exports.loadImages = function(images) {
  return function(scene) {
    return function() {
      images.forEach(({key, path}) => {
        scene.load.image(key, path);
      });
    };
  };
};
