module Graphics.Phaser.BaseSoundManager where

import Effect (Effect)
import Graphics.Phaser.ForeignTypes (BaseSound, BaseSoundManager, PhaserGame, PhaserScene)
import Utils.FFI (_getProp, _method0, _return1, _setProp)

getBaseSoundManager :: PhaserGame -> Effect BaseSoundManager
getBaseSoundManager = _getProp "sound"

add :: String -> BaseSoundManager -> Effect BaseSound
add = _return1 "add"

-- https://photonstorm.github.io/phaser3-docs/Phaser.Sound.BaseSoundManager.html#volume__anchor
volume :: PhaserScene -> Effect Number
volume = _getProp "volume"

setVolume :: Number -> PhaserScene -> Effect PhaserScene
setVolume = _setProp "volume"

-- https://photonstorm.github.io/phaser3-docs/Phaser.Sound.BaseSoundManager.html#play__anchor
play :: String -> BaseSoundManager -> Effect Boolean
play k = _return1 "play" k

-- https://photonstorm.github.io/phaser3-docs/Phaser.Sound.BaseSoundManager.html#pauseAll__anchor
pauseAll :: BaseSoundManager -> Effect BaseSoundManager
pauseAll = _method0 "pauseAll"

-- https://photonstorm.github.io/phaser3-docs/Phaser.Sound.BaseSoundManager.html#resumeAll__anchor
stopAll :: BaseSoundManager -> Effect BaseSoundManager
stopAll = _method0 "stopAll"

-- https://photonstorm.github.io/phaser3-docs/Phaser.Sound.BaseSoundManager.html#stopByKey__anchor
stopByKey :: String -> BaseSoundManager -> Effect Int
stopByKey k = _return1 "stopByKey" k
