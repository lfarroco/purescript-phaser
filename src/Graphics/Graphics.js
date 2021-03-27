"use strict";

exports.solidRectImpl = function ({ x, y }, { width, height }, color, scene) {
  return function () {
    const btn = scene.add.graphics();

    btn.fillStyle(color, 1);

    //btn.lineStyle(2, 0xcdc0b7, 1);

    btn.fillRect(x, y, width, height);
    return btn;
  };
};

// TODO: add borderedsolicolor...

exports.gradientRectImpl = function (
  { x, y },
  { width, height },
  { topLeft, topRight, bottomLeft, bottomRight },
  scene
) {
  return function () {
    const btn = scene.add.graphics();

    btn.fillGradientStyle(topLeft, topRight, bottomLeft, bottomRight, 1);

    btn.fillRect(x, y, width, height);
    return btn;
  };
};
