module Graphics.Phaser.Sprite where

import Prelude

import Effect (Effect)
import Graphics.Phaser.ForeignTypes (ArcadeSprite, PhaserAnimation, PhaserScene, PhaserSprite)
import Utils.FFI (_getProp, _method0, _method1, _method2, _return2, return2, return3, return4)

type FrameNumber
  = { key :: String, frame :: Int }

-- | https://photonstorm.github.io/phaser3-docs/Phaser.GameObjects.Sprite.html
-- | A PhaserSprite also implements the PhaserGameObject typeclass
add :: String -> { x :: Number, y :: Number } -> PhaserScene -> Effect PhaserSprite
add = return2 "add.sprite(v2.x, v2.y, v1)"

-- | Besides having a `PhaserScene` parameter, animations created with `createAnimation`
-- | are in fact global and can be accessed from other scenes. Because of that you
-- | need to create the animations only once in your application.
createAnimation :: String -> Array FrameNumber -> Number -> Int -> PhaserScene -> Effect PhaserAnimation
createAnimation =
  return4 "anims.create({ key: v1, frames: v2, frameRate: v3, repeat: v4, })"

class Sprite :: forall k. k -> Constraint
class Sprite a

instance Sprite ArcadeSprite
instance Sprite PhaserSprite

playAnimation :: forall a. Sprite a=> {key:: String, ignoreIfPlaying:: Boolean} -> a -> Effect a
playAnimation {key, ignoreIfPlaying} = _getProp "anims" >=> _method2 "play" key ignoreIfPlaying 

removeAnimation :: String -> PhaserSprite -> Effect PhaserSprite
removeAnimation = _method1 "anims"

stopAnimation :: PhaserSprite -> Effect PhaserSprite
stopAnimation = _method0 "stop"

stopAfterDelay :: Number -> PhaserSprite -> Effect PhaserSprite
stopAfterDelay = _method1 "stopAfterDelay"

generateFrameNumbers :: String -> Int -> Int -> PhaserScene -> Effect (Array FrameNumber)
generateFrameNumbers =
  return3 "anims.generateFrameNumbers(v1, {start: v2, end: v3})"

type FrameNamesConfig
  = { key :: String
    , prefix :: String
    , start :: Int
    , end :: Int
    , zeroPad :: Int
    }

generateFrameNames :: FrameNamesConfig -> PhaserScene -> Effect PhaserAnimation
generateFrameNames v1 = _getProp "anims" >=> _return2 "generateFrameNames" v1.key v1

setFrame :: Int -> PhaserSprite -> Effect PhaserSprite
setFrame = _method1 "setFrame"
