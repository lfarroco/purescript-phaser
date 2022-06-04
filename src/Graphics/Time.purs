module Graphics.Phaser.Time where

-- https://photonstorm.github.io/phaser3-docs/Phaser.Time.Clock.html


import Effect (Effect)
import Graphics.Phaser.CoreTypes (EventListener)
import Graphics.Phaser.ForeignTypes (PhaserClock, PhaserScene)
import Utils.FFI (_getProp, _method0, _method1, _method2)


time :: PhaserScene -> Effect PhaserClock
time = _getProp "time"

now :: PhaserClock -> Effect Number
now = _getProp "now"

paused :: PhaserClock -> Effect Boolean
paused = _getProp "paused"

scene :: PhaserClock -> Effect PhaserScene
scene = _getProp "scene"

-- TODO: systems

timeScale :: PhaserClock -> Effect Number
timeScale = _getProp "timeScale"

-- Simplified version of TimerEventConfig
-- https://photonstorm.github.io/phaser3-docs/Phaser.Types.Time.html#.TimerEventConfig
type TimerEventConfig = {
  delay :: Number,
  callback :: EventListener
}

addEvent :: TimerEventConfig -> PhaserClock -> Effect PhaserClock 
addEvent = _method1 "addEvent"

clearPendingEvents :: PhaserClock -> Effect PhaserClock 
clearPendingEvents = _method0 "clearPendingEvents"

delayedCall :: Number -> EventListener -> PhaserClock -> Effect PhaserClock 
delayedCall = _method2 "delayedCall"

preUpdate :: Number -> Number -> PhaserClock -> Effect PhaserClock 
preUpdate = _method2 "preUpdate"

removeAll :: PhaserClock -> Effect PhaserClock 
removeAll = _method0 "removeAll"

-- TODO: removeEvent
-- removeEvent :: Array TimerEvent -> PhaserClock -> Effect PhaserClock 
-- removeEvent = _method1 "removeEvent"

update :: Number -> Number -> PhaserClock -> Effect PhaserClock 
update = _method2 "update"

