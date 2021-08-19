'use strict';

exports.addImpl = function (key, { x, y }, scene) {
  return function () {
    return scene.add.sprite(x, y, key);
  };
};

exports.createAnimationImpl = function (key, frames, frameRate, repeat, scene) {
  return function () {
    scene.anims.create({
      key,
      frames,
      frameRate,
      repeat,
    });

    return scene;
  };
};

exports.playAnimationImpl = function (key, sprite) {
  return function () {
    sprite.play(key);

    return sprite;
  };
};

exports.removeAnimationImpl = function (key, scene) {
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

exports.stopAfterDelayImpl = function (ms, sprite) {
  return function () {
    sprite.stopAfterDelay(ms);

    return sprite;
  };
};

/** https://photonstorm.github.io/phaser3-docs/Phaser.Animations.AnimationManager.html#generateFrameNumbers */
exports.generateFrameNumbersImpl = function (key, start, end, scene) {
  return function () {
    return scene.anims.generateFrameNumbers(key, { start, end });
  };
};

/** https://photonstorm.github.io/phaser3-docs/Phaser.Animations.AnimationManager.html#generateFrameNames */
exports.generateFrameNamesImpl = function (
  key,
  prefix,
  start,
  end,
  zeroPad,
  scene
) {
  return function () {
    return scene.anims.generateFrameNames(key, { start, end, prefix, zeroPad });
  };
};

exports.setFrameImpl = function (frame, sprite) {
  return function () {
    return sprite.setFrame(frame);
  };
};
