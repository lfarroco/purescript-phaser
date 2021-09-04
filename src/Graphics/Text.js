'use strict';

exports.createImpl = function ({ pos, text, config }, scene) {
  return scene.add.text(pos.x, pos.y, text, config);
};
