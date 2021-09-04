'use strict';

exports.delay_ = function (scene) {
  return function (delay) {
    return function (onError, onSuccess) {
      scene.time.addEvent({
        delay,
        callback: onSuccess,
      });
      return function (cancelError, cancelerError, cancelerSuccess) {
        req.cancel();
        cancelerSuccess();
      };
    };
  };
};
