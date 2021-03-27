'use strict';

exports.addImage = function(textureKey) {
  return function({x, y}) {
    return function(scene) {
      return function() {
        return scene.add.image(x, y, textureKey);
      };
    };
  };
};

// exports.setImageDisplaySize = function(image) {
//   return function({width, height}) {
//     return function() {
//       image.setDisplaySize(width, height);
//       return {};
//     };
//   };
// };

// exports.setImageOrigin = function(image) {
//   return function({x, y}) {
//     return function() {
//       image.setOrigin(x, y);
//       return {};
//     };
//   };
// };

// exports.setImagePosition = function({x, y}) {
//   return function(image) {
//     return function() {
//       image.setPosition(x, y);
//       return {};
//     };
//   };
// };
