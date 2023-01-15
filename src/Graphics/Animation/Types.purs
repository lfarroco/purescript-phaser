module Graphics.Phaser.Animation.Types where


foreign import data AnimationsNamespace :: Type

foreign import data Animation :: Type

foreign import data AnimationManager :: Type

foreign import data JSONAnimation :: Type

foreign import data TextureManager :: Type

foreign import data AnimationState :: Type

foreign import data AnimationFrame :: Type

foreign import data JSONAnimationFrame :: Type

foreign import data Frame :: Type

type GenerateFrameNumbersConfig
  = { start :: Number
    , end :: Number
    , first :: Boolean
    , outputArray :: Array AnimationFrame
    , frames :: Boolean
    }
