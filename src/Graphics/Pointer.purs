module Graphics.Phaser.Input.Pointer where

import Effect (Effect)
import Graphics.Phaser.CoreTypes (Vector)
import Graphics.Phaser.ForeignTypes (PhaserCamera, PhaserPointer)
import Utils.FFI (_getProperty, _method, method1, return1)

-- https://photonstorm.github.io/phaser3-docs/Phaser.Input.Pointer.html
--
-- Members
active :: PhaserPointer -> Effect Boolean
active = _getProperty "active"

angle :: PhaserPointer -> Effect Number
angle = _getProperty "angle"

button :: PhaserPointer -> Effect Number
button = _getProperty "button"

buttons :: PhaserPointer -> Effect Number
buttons = _getProperty "buttons"

camera :: PhaserPointer -> Effect PhaserCamera
camera = _getProperty "camera"

deltaX :: PhaserPointer -> Effect Number
deltaX = _getProperty "deltaX"

deltaY :: PhaserPointer -> Effect Number
deltaY = _getProperty "deltaY"

deltaZ :: PhaserPointer -> Effect Number
deltaZ = _getProperty "deltaZ"

distance :: PhaserPointer -> Effect Number
distance = _getProperty "distance"

downTime :: PhaserPointer -> Effect Number
downTime = _getProperty "downTime"

downX :: PhaserPointer -> Effect Number
downX = _getProperty "downX"

downY :: PhaserPointer -> Effect Number
downY = _getProperty "downY"

id :: PhaserPointer -> Effect Number
id = _getProperty "id"

identifier :: PhaserPointer -> Effect Number
identifier = _getProperty "identifier"

isDown :: PhaserPointer -> Effect Boolean
isDown = _getProperty "isDown"

locked :: PhaserPointer -> Effect Boolean
locked = _getProperty "locked"

motionFactor :: PhaserPointer -> Effect Number
motionFactor = _getProperty "motionFactor"

movementX :: PhaserPointer -> Effect Number
movementX = _getProperty "movementX"

movementY :: PhaserPointer -> Effect Number
movementY = _getProperty "movementY"

moveTime :: PhaserPointer -> Effect Number
moveTime = _getProperty "moveTime"

pointerId :: PhaserPointer -> Effect Number
pointerId = _getProperty "pointerId"

position :: PhaserPointer -> Effect Vector
position = _getProperty "position"

prevPosition :: PhaserPointer -> Effect Vector
prevPosition = _getProperty "prevPosition"

primaryDown :: PhaserPointer -> Effect Boolean
primaryDown = _getProperty "primaryDown"

smoothFactor :: PhaserPointer -> Effect Number
smoothFactor = _getProperty "smoothFactor"

time :: PhaserPointer -> Effect Number
time = _getProperty "time"

upTime :: PhaserPointer -> Effect Number
upTime = _getProperty "upTime"

upX :: PhaserPointer -> Effect Number
upX = _getProperty "upX"

upY :: PhaserPointer -> Effect Number
upY = _getProperty "upY"

velocity :: PhaserPointer -> Effect Vector
velocity = _getProperty "velocity"

wasTouch :: PhaserPointer -> Effect Boolean
wasTouch = _getProperty "wasTouch"

worldX :: PhaserPointer -> Effect Number
worldX = _getProperty "worldX"

worldY :: PhaserPointer -> Effect Number
worldY = _getProperty "worldY"

x :: PhaserPointer -> Effect Number
x = _getProperty "y"

y :: PhaserPointer -> Effect Number
y = _getProperty "y"

-- Methods
backButtonDown :: PhaserPointer -> Effect Boolean
backButtonDown = _method "backButtonDown" []

backButtonReleased :: PhaserPointer -> Effect Boolean
backButtonReleased = _method "backButtonReleased" []

destroy :: PhaserPointer -> Effect PhaserPointer
destroy = _method "destroy" []

forwardButtonDown :: PhaserPointer -> Effect Boolean
forwardButtonDown = _method "forwardButtonDown" []

forwardButtonReleased :: PhaserPointer -> Effect Boolean
forwardButtonReleased = _method "forwardButtonReleased" []

getAngle :: PhaserPointer -> Effect Number
getAngle = _method "getAngle" []

getDistance :: PhaserPointer -> Effect Number
getDistance = _method "getDistance" []

getDistanceX :: PhaserPointer -> Effect Number
getDistanceX = _method "getDistanceX" []

getDistanceY :: PhaserPointer -> Effect Number
getDistanceY = _method "getDistanceY" []

getDuration :: PhaserPointer -> Effect Number
getDuration = _method "getDuration" []

getInterpolatedPosition :: Int -> PhaserPointer -> Effect (Array Vector)
getInterpolatedPosition = return1 "getInterpolatedPosition(v1)"

leftButtonDown :: PhaserPointer -> Effect Boolean
leftButtonDown = _method "leftButtonDown" []

leftButtonReleased :: PhaserPointer -> Effect Boolean
leftButtonReleased = _method "leftButtonReleased" []

middleButtonDown :: PhaserPointer -> Effect Boolean
middleButtonDown = _method "middleButtonDown" []

middleButtonReleased :: PhaserPointer -> Effect Boolean
middleButtonReleased = _method "middleButtonReleased" []

noButtonDown :: PhaserPointer -> Effect Boolean
noButtonDown = _method "noButtonDown" []

positionToCamera :: PhaserCamera -> PhaserPointer -> Effect Boolean
positionToCamera = return1 "positionToCamera(v1)"

rightButtonDown :: PhaserPointer -> Effect Boolean
rightButtonDown = _method "rightButtonDown" []

rightButtonReleased :: PhaserPointer -> Effect Boolean
rightButtonReleased = _method "rightButtonReleased" []

updateWorldPoint :: PhaserCamera -> PhaserPointer -> Effect PhaserPointer
updateWorldPoint = method1 "updateWorldPoint(v1)"
