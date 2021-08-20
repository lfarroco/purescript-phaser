module Graphics.Phaser.Sprite where

import Data.Function.Uncurried (Fn2, runFn2, Fn3, runFn3, Fn4, runFn4, Fn5, runFn5)
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserAnimation, PhaserScene, PhaserSprite)

type FrameNumber
  = Array { key :: String, frame :: Int }

-- | https://photonstorm.github.io/phaser3-docs/Phaser.GameObjects.Sprite.html
-- | A PhaserSprite also implements the PhaserGameObject typeclass
foreign import addImpl :: Fn3 String { x :: Number, y :: Number } PhaserScene (Effect PhaserSprite)

add :: String -> { x :: Number, y :: Number } -> PhaserScene -> Effect PhaserSprite
add = runFn3 addImpl

foreign import createAnimationImpl :: Fn5 String (Array FrameNumber) Number Int PhaserScene (Effect PhaserAnimation)

-- | Besides having a `PhaserScene` parameter, animations created with `createAnimation`
-- | are in fact global and can be accessed from other scenes. Because of that you
-- | need to create the animations only once in your application.
createAnimation :: String -> Array FrameNumber -> Number -> Int -> PhaserScene -> Effect PhaserAnimation
createAnimation = runFn5 createAnimationImpl

foreign import playAnimationImpl :: Fn2 String PhaserSprite (Effect PhaserSprite)

playAnimation :: String -> PhaserSprite -> Effect PhaserSprite
playAnimation = runFn2 playAnimationImpl

foreign import removeAnimationImpl :: Fn2 String PhaserSprite (Effect PhaserSprite)

removeAnimation :: String -> PhaserSprite -> Effect PhaserSprite
removeAnimation = runFn2 removeAnimationImpl

foreign import stopAnimation :: PhaserSprite -> Effect PhaserSprite

foreign import stopAfterDelayImpl :: Fn2 Number PhaserSprite (Effect PhaserSprite)

stopAfterDelay :: Number -> PhaserSprite -> Effect PhaserSprite
stopAfterDelay = runFn2 stopAfterDelayImpl

foreign import generateFrameNumbersImpl :: Fn4 String Int Int PhaserScene (Effect (Array FrameNumber))

generateFrameNumbers :: String -> Int -> Int -> PhaserScene -> Effect (Array FrameNumber)
generateFrameNumbers = runFn4 generateFrameNumbersImpl

type FrameNamesConfig
  = { key :: String
    , prefix :: String
    , start :: Int
    , end :: Int
    , zeroPad :: Int
    }

foreign import generateFrameNamesImpl :: Fn2 FrameNamesConfig PhaserScene (Effect PhaserAnimation)

generateFrameNames :: FrameNamesConfig -> PhaserScene -> Effect PhaserAnimation
generateFrameNames = runFn2 generateFrameNamesImpl

foreign import setFrameImpl :: Fn2 Int PhaserSprite (Effect PhaserSprite)

setFrame :: Int -> PhaserSprite -> Effect PhaserSprite
setFrame = runFn2 setFrameImpl
