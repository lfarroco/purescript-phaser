"use strict";

exports.add = function (scene, x, y, key) {
  return function () {
    return scene.add.sprite(x, y, key);
  };
};

exports.createAnimation = function (sprite) {
  return function () {
    sprite.anims.create({
      key,
      frames,
      frameRate,
      repeat,
    });

    return sprite;
  };
};

exports.playAnimation = function (sprite, key) {
  return function () {
    sprite.play(key);

    return sprite;
  };
};

exports.removeAnimation = function (scene, key) {
  return function () {
    scene.anims.remove(key);

    return scene;
  };
};

exports.stopAnimation = function (sprite) {
  return function () {
    sprite.stop();

    return sprite;
  };
};
exports.stopAfterDelay = function (sprite, ms) {
  return function () {
    sprite.stopAfterDelay(ms);

    return sprite;
  };
};
/** https://photonstorm.github.io/phaser3-docs/Phaser.Animations.AnimationManager.html#generateFrameNumbers */
exports.generateFrameNumbers = function (scene, key, start, end) {
  return function () {
    scene.anims.generateFrameNumbers(key, { start, end });

    return scene;
  };
};

/** https://photonstorm.github.io/phaser3-docs/Phaser.Animations.AnimationManager.html#generateFrameNames */
exports.generateFrameNames = function (
  scene,
  key,
  prefix,
  start,
  end,
  zeroPad
) {
  return function () {
    scene.anims.generateFrameNames(key, { start, end, prefix, zeroPad });

    return scene;
  };
};
