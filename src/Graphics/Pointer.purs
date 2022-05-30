module Graphics.Phaser.Input.Pointer where

import Effect (Effect)
import Graphics.Phaser.CoreTypes (Vector)
import Graphics.Phaser.ForeignTypes (PhaserCamera, PhaserPointer)
import Utils.FFI (_getProp, _method0, method1, _return0, return1)

-- https://photonstorm.github.io/phaser3-docs/Phaser.Input.Pointer.html
--
-- Members
active :: PhaserPointer -> Effect Boolean
active = _getProp "active"

angle :: PhaserPointer -> Effect Number
angle = _getProp "angle"

button :: PhaserPointer -> Effect Number
button = _getProp "button"

buttons :: PhaserPointer -> Effect Number
buttons = _getProp "buttons"

camera :: PhaserPointer -> Effect PhaserCamera
camera = _getProp "camera"

deltaX :: PhaserPointer -> Effect Number
deltaX = _getProp "deltaX"

deltaY :: PhaserPointer -> Effect Number
deltaY = _getProp "deltaY"

deltaZ :: PhaserPointer -> Effect Number
deltaZ = _getProp "deltaZ"

distance :: PhaserPointer -> Effect Number
distance = _getProp "distance"

downTime :: PhaserPointer -> Effect Number
downTime = _getProp "downTime"

downX :: PhaserPointer -> Effect Number
downX = _getProp "downX"

downY :: PhaserPointer -> Effect Number
downY = _getProp "downY"

id :: PhaserPointer -> Effect Number
id = _getProp "id"

identifier :: PhaserPointer -> Effect Number
identifier = _getProp "identifier"

isDown :: PhaserPointer -> Effect Boolean
isDown = _getProp "isDown"

locked :: PhaserPointer -> Effect Boolean
locked = _getProp "locked"

motionFactor :: PhaserPointer -> Effect Number
motionFactor = _getProp "motionFactor"

movementX :: PhaserPointer -> Effect Number
movementX = _getProp "movementX"

movementY :: PhaserPointer -> Effect Number
movementY = _getProp "movementY"

moveTime :: PhaserPointer -> Effect Number
moveTime = _getProp "moveTime"

pointerId :: PhaserPointer -> Effect Number
pointerId = _getProp "pointerId"

position :: PhaserPointer -> Effect Vector
position = _getProp "position"

prevPosition :: PhaserPointer -> Effect Vector
prevPosition = _getProp "prevPosition"

primaryDown :: PhaserPointer -> Effect Boolean
primaryDown = _getProp "primaryDown"

smoothFactor :: PhaserPointer -> Effect Number
smoothFactor = _getProp "smoothFactor"

time :: PhaserPointer -> Effect Number
time = _getProp "time"

upTime :: PhaserPointer -> Effect Number
upTime = _getProp "upTime"

upX :: PhaserPointer -> Effect Number
upX = _getProp "upX"

upY :: PhaserPointer -> Effect Number
upY = _getProp "upY"

velocity :: PhaserPointer -> Effect Vector
velocity = _getProp "velocity"

wasTouch :: PhaserPointer -> Effect Boolean
wasTouch = _getProp "wasTouch"

worldX :: PhaserPointer -> Effect Number
worldX = _getProp "worldX"

worldY :: PhaserPointer -> Effect Number
worldY = _getProp "worldY"

x :: PhaserPointer -> Effect Number
x = _getProp "y"

y :: PhaserPointer -> Effect Number
y = _getProp "y"

-- Methods
backButtonDown :: PhaserPointer -> Effect Boolean
backButtonDown = _return0 "backButtonDown"

backButtonReleased :: PhaserPointer -> Effect Boolean
backButtonReleased = _return0 "backButtonReleased"

destroy :: PhaserPointer -> Effect PhaserPointer
destroy = _method0 "destroy"

forwardButtonDown :: PhaserPointer -> Effect Boolean
forwardButtonDown = _return0 "forwardButtonDown"

forwardButtonReleased :: PhaserPointer -> Effect Boolean
forwardButtonReleased = _return0 "forwardButtonReleased"

getAngle :: PhaserPointer -> Effect Number
getAngle = _return0 "getAngle"

getDistance :: PhaserPointer -> Effect Number
getDistance = _return0 "getDistance"

getDistanceX :: PhaserPointer -> Effect Number
getDistanceX = _return0 "getDistanceX"

getDistanceY :: PhaserPointer -> Effect Number
getDistanceY = _return0 "getDistanceY"

getDuration :: PhaserPointer -> Effect Number
getDuration = _return0 "getDuration"

getInterpolatedPosition :: Int -> PhaserPointer -> Effect (Array Vector)
getInterpolatedPosition = return1 "getInterpolatedPosition(v1)"

leftButtonDown :: PhaserPointer -> Effect Boolean
leftButtonDown = _return0 "leftButtonDown"

leftButtonReleased :: PhaserPointer -> Effect Boolean
leftButtonReleased = _return0 "leftButtonReleased"

middleButtonDown :: PhaserPointer -> Effect Boolean
middleButtonDown = _return0 "middleButtonDown"

middleButtonReleased :: PhaserPointer -> Effect Boolean
middleButtonReleased = _return0 "middleButtonReleased"

noButtonDown :: PhaserPointer -> Effect Boolean
noButtonDown = _return0 "noButtonDown"

positionToCamera :: PhaserCamera -> PhaserPointer -> Effect Boolean
positionToCamera = return1 "positionToCamera(v1)"

rightButtonDown :: PhaserPointer -> Effect Boolean
rightButtonDown = _return0 "rightButtonDown"

rightButtonReleased :: PhaserPointer -> Effect Boolean
rightButtonReleased = _return0 "rightButtonReleased"

updateWorldPoint :: PhaserCamera -> PhaserPointer -> Effect PhaserPointer
updateWorldPoint = method1 "updateWorldPoint(v1)"
