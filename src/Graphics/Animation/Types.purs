module Graphics.Phaser.Animation.Types where

import Graphics.Phaser.ForeignTypes (AnimationFrame)

type GenerateFrameNumbersConfig = {
  start :: Number,
  end :: Number,
  first :: Boolean,
  outputArray :: Array AnimationFrame,
  frames :: Boolean
  }
