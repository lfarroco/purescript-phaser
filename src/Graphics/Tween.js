"use strict";

exports.addTween = function ({
  scene,
  targets,
  props,
  delay,
  duration,
  ease,
  repeat,
  yoyo,
}) {
  return function () {
    // use tween.setCallBack to define callback
    let config = {
      targets,
      delay,
      duration,
      ease,
      repeat,
      yoyo,
    };

    // spread props into the config object
    Object.assign(config, props);

    return scene.add.tween(config);
  };
};
