module Graphics.Tweens.TweenManager where

--
-- https://photonstorm.github.io/phaser3-docs/Phaser.Tweens.TweenManager.html
-- Status: Incomplete
--
import Effect (Effect)
import Graphics.Phaser.CoreTypes (class GameObject)
import Graphics.Phaser.ForeignTypes (PhaserScene, PhaserTween, PhaserTweenManager)
import Utils.FFI (_getProp, _method1, _return1)

getTweenManager :: PhaserScene -> Effect PhaserTweenManager
getTweenManager = _getProp "tweens"

killTweensOf :: forall a. GameObject a => Array a -> PhaserTweenManager -> Effect PhaserTweenManager
killTweensOf = _method1 "killTweensOf"

getTweensOf :: forall a. GameObject a => a -> PhaserTweenManager -> Effect (Array PhaserTween)
getTweensOf = _return1 "getTweensOf"
