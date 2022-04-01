module Graphics.Phaser.Input.Pointer where

import Prelude
import Effect (Effect)
import Graphics.Phaser.CoreTypes (Vector)
import Graphics.Phaser.ForeignTypes (PhaserCamera, PhaserPointer)
import Utils.FFI (getProperty, method0, method1, return0, return1)

-- https://photonstorm.github.io/phaser3-docs/Phaser.Input.Pointer.html
--
-- Members
active :: PhaserPointer -> Effect Boolean
active = getProperty "active"

angle :: PhaserPointer -> Effect Number
angle = getProperty "angle"

button :: PhaserPointer -> Effect Number
button = getProperty "button"

buttons :: PhaserPointer -> Effect Number
buttons = getProperty "buttons"

camera :: PhaserPointer -> Effect PhaserCamera
camera = getProperty "camera"

deltaX :: PhaserPointer -> Effect Number
deltaX = getProperty "deltaX"

deltaY :: PhaserPointer -> Effect Number
deltaY = getProperty "deltaY"

deltaZ :: PhaserPointer -> Effect Number
deltaZ = getProperty "deltaZ"

distance :: PhaserPointer -> Effect Number
distance = getProperty "distance"

downTime :: PhaserPointer -> Effect Number
downTime = getProperty "downTime"

downX :: PhaserPointer -> Effect Number
downX = getProperty "downX"

downY :: PhaserPointer -> Effect Number
downY = getProperty "downY"

id :: PhaserPointer -> Effect Number
id = getProperty "id"

identifier :: PhaserPointer -> Effect Number
identifier = getProperty "identifier"

isDown :: PhaserPointer -> Effect Boolean
isDown = getProperty "isDown"

locked :: PhaserPointer -> Effect Boolean
locked = getProperty "locked"

motionFactor :: PhaserPointer -> Effect Number
motionFactor = getProperty "motionFactor"

movementX :: PhaserPointer -> Effect Number
movementX = getProperty "movementX"

movementY :: PhaserPointer -> Effect Number
movementY = getProperty "movementY"

moveTime :: PhaserPointer -> Effect Number
moveTime = getProperty "moveTime"

pointerId :: PhaserPointer -> Effect Number
pointerId = getProperty "pointerId"

position :: PhaserPointer -> Effect Vector
position = getProperty "position"

prevPosition :: PhaserPointer -> Effect Vector
prevPosition = getProperty "prevPosition"

primaryDown :: PhaserPointer -> Effect Boolean
primaryDown = getProperty "primaryDown"

smoothFactor :: PhaserPointer -> Effect Number
smoothFactor = getProperty "smoothFactor"

time :: PhaserPointer -> Effect Number
time = getProperty "time"

upTime :: PhaserPointer -> Effect Number
upTime = getProperty "upTime"

upX :: PhaserPointer -> Effect Number
upX = getProperty "upX"

upY :: PhaserPointer -> Effect Number
upY = getProperty "upY"

velocity :: PhaserPointer -> Effect Vector
velocity = getProperty "velocity"

wasTouch :: PhaserPointer -> Effect Boolean
wasTouch = getProperty "wasTouch"

worldX :: PhaserPointer -> Effect Number
worldX = getProperty "worldX"

worldY :: PhaserPointer -> Effect Number
worldY = getProperty "worldY"

x :: PhaserPointer -> Effect Number
x = getProperty "y"

y :: PhaserPointer -> Effect Number
y = getProperty "y"

-- Methods
backButtonDown :: PhaserPointer -> Effect Boolean
backButtonDown = return0 "backButtonDown()"

backButtonReleased :: PhaserPointer -> Effect Boolean
backButtonReleased = return0 "backButtonReleased()"

destroy :: PhaserPointer -> Effect PhaserPointer
destroy = method0 "destroy()"

forwardButtonDown :: PhaserPointer -> Effect Boolean
forwardButtonDown = return0 "forwardButtonDown()"

forwardButtonReleased :: PhaserPointer -> Effect Boolean
forwardButtonReleased = return0 "forwardButtonReleased()"

getAngle :: PhaserPointer -> Effect Number
getAngle = return0 "getAngle()"

getDistance :: PhaserPointer -> Effect Number
getDistance = return0 "getDistance()"

getDistanceX :: PhaserPointer -> Effect Number
getDistanceX = return0 "getDistanceX()"

getDistanceY :: PhaserPointer -> Effect Number
getDistanceY = return0 "getDistanceY()"

getDuration :: PhaserPointer -> Effect Number
getDuration = return0 "getDuration()"

getInterpolatedPosition :: Int -> PhaserPointer -> Effect (Array Vector)
getInterpolatedPosition = return1 "getInterpolatedPosition(v1)"

leftButtonDown :: PhaserPointer -> Effect Boolean
leftButtonDown = return0 "leftButtonDown()"

leftButtonReleased :: PhaserPointer -> Effect Boolean
leftButtonReleased = return0 "leftButtonReleased()"

middleButtonDown :: PhaserPointer -> Effect Boolean
middleButtonDown = return0 "middleButtonDown()"

middleButtonReleased :: PhaserPointer -> Effect Boolean
middleButtonReleased = return0 "middleButtonReleased()"

noButtonDown :: PhaserPointer -> Effect Boolean
noButtonDown = return0 "noButtonDown()"

positionToCamera :: PhaserCamera -> PhaserPointer -> Effect Boolean
positionToCamera = return1 "positionToCamera(v1)"

rightButtonDown :: PhaserPointer -> Effect Boolean
rightButtonDown = return0 "rightButtonDown()"

rightButtonReleased :: PhaserPointer -> Effect Boolean
rightButtonReleased = return0 "rightButtonReleased()"

updateWorldPoint :: PhaserCamera -> PhaserPointer -> Effect PhaserPointer
updateWorldPoint = method1 "updateWorldPoint(v1)"
