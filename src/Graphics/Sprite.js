'use strict';

exports.addImpl = function (key, { x, y }, scene) {
  return scene.add.sprite(x, y, key);
};

exports.createAnimationImpl = function (key, frames, frameRate, repeat, scene) {
  scene.anims.create({
    key,
    frames,
    frameRate,
    repeat,
  });

  return scene;
};

exports.playAnimationImpl = function (key, sprite) {
  sprite.play(key);

  return sprite;
};

exports.removeAnimationImpl = function (key, scene) {
  scene.anims.remove(key);

  return scene;
};

exports.stopAnimation = function (sprite) {
  sprite.stop();

  return sprite;
};

exports.stopAfterDelayImpl = function (ms, sprite) {
  sprite.stopAfterDelay(ms);

  return sprite;
};

/** https://photonstorm.github.io/phaser3-docs/Phaser.Animations.AnimationManager.html#generateFrameNumbers */
exports.generateFrameNumbersImpl = function (key, start, end, scene) {
  return scene.anims.generateFrameNumbers(key, { start, end });
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
  return scene.anims.generateFrameNames(key, { start, end, prefix, zeroPad });
};

exports.setFrameImpl = function (frame, sprite) {
  return sprite.setFrame(frame);
};
