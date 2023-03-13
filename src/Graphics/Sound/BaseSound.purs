module Graphics.Sound.BaseSound where

import Prelude
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (BaseSound)
import Utils.FFI (_getProp, _return0, _return1)

currentMarker :: BaseSound -> Effect Number
currentMarker = _getProp "currentMarker"

duration :: BaseSound -> Effect Number
duration = _getProp "duration"

isPaused :: BaseSound -> Effect Boolean
isPaused = _getProp "isPaused"

isPlaying :: BaseSound -> Effect Boolean
isPlaying = _getProp "isPlaying"

key :: BaseSound -> Effect String
key = _getProp "key"

totalDuration :: BaseSound -> Effect Number
totalDuration = _getProp "totalDuration"

totalRate :: BaseSound -> Effect Number
totalRate = _getProp "totalRate"

destroy :: BaseSound -> Effect Unit
destroy = _return0 "destroy"

pause :: BaseSound -> Effect Unit
pause = _return0 "pause"

play :: BaseSound -> Effect Unit
play = _return0 "play"

resume :: BaseSound -> Effect Unit
resume = _return0 "resume"

stop :: BaseSound -> Effect Unit
stop = _return0 "stop"

setVolume :: Number -> BaseSound -> Effect Unit
setVolume = _return1 "setVolume"
