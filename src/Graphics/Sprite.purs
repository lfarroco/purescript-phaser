module Graphics.Phaser.Sprite
  ( add
  , createAnimation
  , playAnimation
  , removeAnimation
  , stopAfterDelay
  , generateFrameNumbers
  , generateFrameNames
  , setFrame
  ) where

import Effect.Uncurried (EffectFn2, runEffectFn2, EffectFn3, runEffectFn3, EffectFn4, runEffectFn4, EffectFn5, runEffectFn5)
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserAnimation, PhaserScene, PhaserSprite)

type FrameNumber
  = Array { key :: String, frame :: Int }

-- | https://photonstorm.github.io/phaser3-docs/Phaser.GameObjects.Sprite.html
-- | A PhaserSprite also implements the PhaserGameObject typeclass
foreign import addImpl :: EffectFn3 String { x :: Number, y :: Number } PhaserScene PhaserSprite

add :: String -> { x :: Number, y :: Number } -> PhaserScene -> Effect PhaserSprite
add = runEffectFn3 addImpl

foreign import createAnimationImpl :: EffectFn5 String (Array FrameNumber) Number Int PhaserScene PhaserAnimation

-- | Besides having a `PhaserScene` parameter, animations created with `createAnimation`
-- | are in fact global and can be accessed from other scenes. Because of that you
-- | need to create the animations only once in your application.
createAnimation :: String -> Array FrameNumber -> Number -> Int -> PhaserScene -> Effect PhaserAnimation
createAnimation = runEffectFn5 createAnimationImpl

foreign import playAnimationImpl :: EffectFn2 String PhaserSprite PhaserSprite

playAnimation :: String -> PhaserSprite -> Effect PhaserSprite
playAnimation = runEffectFn2 playAnimationImpl

foreign import removeAnimationImpl :: EffectFn2 String PhaserSprite PhaserSprite

removeAnimation :: String -> PhaserSprite -> Effect PhaserSprite
removeAnimation = runEffectFn2 removeAnimationImpl

foreign import stopAnimation :: PhaserSprite -> Effect PhaserSprite

foreign import stopAfterDelayImpl :: EffectFn2 Number PhaserSprite PhaserSprite

stopAfterDelay :: Number -> PhaserSprite -> Effect PhaserSprite
stopAfterDelay = runEffectFn2 stopAfterDelayImpl

foreign import generateFrameNumbersImpl :: EffectFn4 String Int Int PhaserScene (Array FrameNumber)

generateFrameNumbers :: String -> Int -> Int -> PhaserScene -> Effect (Array FrameNumber)
generateFrameNumbers = runEffectFn4 generateFrameNumbersImpl

type FrameNamesConfig
  = { key :: String
    , prefix :: String
    , start :: Int
    , end :: Int
    , zeroPad :: Int
    }

foreign import generateFrameNamesImpl :: EffectFn2 FrameNamesConfig PhaserScene PhaserAnimation

generateFrameNames :: FrameNamesConfig -> PhaserScene -> Effect PhaserAnimation
generateFrameNames = runEffectFn2 generateFrameNamesImpl

foreign import setFrameImpl :: EffectFn2 Int PhaserSprite PhaserSprite

setFrame :: Int -> PhaserSprite -> Effect PhaserSprite
setFrame = runEffectFn2 setFrameImpl
