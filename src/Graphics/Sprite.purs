module Graphics.Phaser.Sprite where

import Prelude

import Effect (Effect)
import Graphics.Phaser.ForeignTypes (ArcadeSprite, PhaserAnimation, PhaserScene, PhaserSprite)
import Utils.FFI (_getProp, _method0, _method1, _return1, _return2, _return3)

type FrameNumber
  = { key :: String, frame :: Int }

-- | https://photonstorm.github.io/phaser3-docs/Phaser.GameObjects.Sprite.html
-- | A PhaserSprite also implements the PhaserGameObject typeclass
create :: { x :: Number, y :: Number } -> String -> PhaserScene -> Effect PhaserSprite
create {x,y} v2 = _getProp "add"  >=> _return3 "sprite" x y v2 

-- | Besides having a `PhaserScene` parameter, animations created with `createAnimation`
-- | are in fact global and can be accessed from other scenes. Because of that you
-- | need to create the animations only once in your application.
createAnimation :: String -> Array FrameNumber -> Number -> Int -> PhaserScene -> Effect PhaserAnimation
createAnimation key frames frameRate repeat =  _getProp "anims" 
 >=> _return1 "create" { key, frames, frameRate, repeat }

class Sprite :: forall k. k -> Constraint
class Sprite a

instance Sprite ArcadeSprite
instance Sprite PhaserSprite

playAnimation :: forall a. Sprite a => {key:: String, ignoreIfPlaying:: Boolean} -> a -> Effect a
playAnimation {key, ignoreIfPlaying} obj =
   _getProp "anims" obj 
     >>= _return2 "play" key ignoreIfPlaying 
     >>= const (pure obj)

removeAnimation :: String -> PhaserSprite -> Effect PhaserSprite
removeAnimation = _method1 "anims"

stopAnimation :: PhaserSprite -> Effect PhaserSprite
stopAnimation = _method0 "stop"

stopAfterDelay :: Number -> PhaserSprite -> Effect PhaserSprite
stopAfterDelay = _method1 "stopAfterDelay"

generateFrameNumbers :: String -> Int -> Int -> PhaserScene -> Effect (Array FrameNumber)
generateFrameNumbers v1 start end = _getProp "anims" >=> _return2 "generateFrameNumbers" v1 {start, end}

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
