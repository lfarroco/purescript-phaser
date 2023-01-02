module Graphics.Phaser.ArcadePhysics where

-- A port of
-- https://photonstorm.github.io/phaser3-docs/Phaser.Physics.Arcade.StaticGroup.html
-- TODO: create Groups as parent of static and dynamic groups
import Prelude
import Effect (Effect)
import Graphics.Canvas (Dimensions)
import Graphics.Phaser.CoreTypes (class ArcadeGroup, class Collidable, class GameObject, class PhysicsEnabled, Vector)
import Graphics.Phaser.Events (createEventListener2)
import Graphics.Phaser.ForeignTypes (ArcadeImage, ArcadeSprite, Group, PhaserArcadeWorld, PhaserPhysicsPlugin, PhaserScene, StaticGroup)
import Utils.FFI (_getProp, _method0, _method1, _method2, _method3, _method4, _return0, _return1, _return2, _return3, _return4)

-- All Game Objects created by or added to this Group will automatically be given static Arcade Physics bodies, if they have no body.
createStaticGroup :: PhaserPhysicsPlugin -> Effect StaticGroup
createStaticGroup = _getProp "add" >=> _return0 "staticGroup"

createGroup :: PhaserPhysicsPlugin -> Effect Group
createGroup = _getProp "add" >=> _return0 "group"

createChild :: forall g. ArcadeGroup g => Vector -> String -> g -> Effect ArcadeSprite
createChild { x, y } v2 = _return3 "create" x y v2

addChild :: forall a g. GameObject a => ArcadeGroup g => a -> g -> Effect g
addChild = _method1 "add"

createArcadeImage :: Vector -> String -> PhaserPhysicsPlugin -> Effect ArcadeImage
createArcadeImage { x, y } v2 = _getProp "add" >=> _return3 "image" x y v2

createArcadeSprite :: Vector -> String -> PhaserPhysicsPlugin -> Effect ArcadeSprite
createArcadeSprite { x, y } v2 = _getProp "add" >=> _return3 "sprite" x y v2

setWorldBounds :: Vector -> Dimensions -> PhaserScene -> Effect PhaserScene
setWorldBounds { x, y } { width, height } scn =
  _getProp "world" scn
    >>= _return4 "setWorldBounds" x y width height
    >>= const (pure scn)

refreshBody :: forall a. PhysicsEnabled a => a -> Effect a
refreshBody = _method0 "refreshBody"

setImmovable :: forall a. PhysicsEnabled a => Boolean -> a -> Effect a
setImmovable = _method1 "setImmovable"

allowGravity :: forall a. PhysicsEnabled a => a -> Effect Boolean
allowGravity = _getProp "body.allowGravity"

setAllowGravity :: forall a. PhysicsEnabled a => Boolean -> a -> Effect a
setAllowGravity v1 obj =
  _getProp "body" obj
    >>= _return1 "setAllowGravity" v1
    >>= const (pure obj)

acceleration :: forall a. PhysicsEnabled a => a -> Effect Vector
acceleration = _getProp "body.acceleration"

-- https://photonstorm.github.io/phaser3-docs/Phaser.Physics.Arcade.Body.html#facing__anchor
-- NONE: 10
-- UP: 11
-- DOWN: 12
-- LEFT: 13
-- RIGHT: 14
facing :: forall a. PhysicsEnabled a => a -> Effect Int
facing = _getProp "body" >=> _getProp "facing"

velocity :: forall a. PhysicsEnabled a => a -> Effect Vector
velocity obj = _getProp "body" obj >>= _getProp "velocity"

setVelocityX :: forall a. PhysicsEnabled a => Number -> a -> Effect a
setVelocityX v1 obj =
  _getProp "body" obj >>= _method1 "setVelocityX" v1
    >>= const (pure obj)

setVelocityY :: forall a. PhysicsEnabled a => Number -> a -> Effect a
setVelocityY v1 obj =
  _getProp "body" obj >>= _method1 "setVelocityY" v1
    >>= const (pure obj)

setVelocity :: forall a. PhysicsEnabled a => Vector -> a -> Effect a
setVelocity { x, y } obj =
  _getProp "body" obj >>= _method2 "setVelocity" x y
    >>= const (pure obj)

setBounce :: forall a. PhysicsEnabled a => Number -> a -> Effect a
setBounce v1 obj =
  _getProp "body" obj >>= _method1 "setBounce" v1
    >>= const (pure obj)

setCollideWorldBounds :: forall a. PhysicsEnabled a => Boolean -> a -> Effect a
setCollideWorldBounds = _method1 "setCollideWorldBounds"

addCollider :: forall a b. Collidable a => Collidable b => a -> b -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
addCollider v1 v2 plugin =
  _getProp "add" plugin
    >>= _return2 "collider" v1 v2
    >>= const (pure plugin)

addColliderWithCallback :: forall a b. Collidable a => Collidable b => Array a -> Array b -> (a -> b -> Effect Unit) -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
addColliderWithCallback v1 v2 v3 plugin =
  _getProp "add" plugin
    >>= _return3 "collider" v1 v2 (createEventListener2 v3)
    >>= const (pure plugin)

type ArcadeBodyCollision
  = { none :: Boolean
    , up :: Boolean
    , down :: Boolean
    , left :: Boolean
    , right :: Boolean
    }

getTouching :: forall a. PhysicsEnabled a => a -> Effect ArcadeBodyCollision
getTouching = _getProp "body" >=> _getProp "touching"

addOverlap :: forall a b c d. Collidable a => Collidable b => Collidable c => Collidable d => a -> b -> (c -> d -> Effect Unit) -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
addOverlap v1 v2 v3 plugin = do
  let
    listener = createEventListener2 v3
  _getProp "add" plugin
    >>= _return3 "overlap" v1 v2 listener
    >>= const (pure plugin)

disableBody :: forall a. PhysicsEnabled a => a -> Effect a
disableBody = _method2 "disableBody" true true

accelerateTo :: forall a. GameObject a => a -> Vector -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
accelerateTo v1 { x, y } = _method3 "accelerateTo" v1 x y

accelerateToObject :: forall a b. GameObject a => GameObject b => a -> b -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
accelerateToObject = _method2 "accelerateToObject"

closest :: forall a. GameObject a => a -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
closest = _method1 "closest"

furthest :: forall a. GameObject a => a -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
furthest = _method1 "furthest"

collide :: forall a b. GameObject a => GameObject b => Array a -> Array b -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
collide = _method2 "collide"

collideWithCallback :: forall a b. GameObject a => GameObject b => Array a -> Array b -> (a -> b -> Effect Unit) -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
collideWithCallback v1 v2 v3 = _method3 "collide" v1 v2 (createEventListener2 v3)

moveTo :: forall a. GameObject a => a -> Vector -> Number -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
moveTo v1 { x, y } v3 = _method4 "moveTo" v1 x y v3

moveToObject :: forall a b. GameObject a => GameObject b => a -> b -> Number -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
moveToObject = _method3 "moveTo"

overlap :: forall a b. GameObject a => GameObject b => Array a -> Array b -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
overlap = _method2 "overlap"

overlapWithCallback :: forall a b. GameObject a => GameObject b => Array a -> Array b -> (a -> b -> Effect Unit) -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
overlapWithCallback v1 v2 v3 = _method3 "overlap" v1 v2 (createEventListener2 v3)

pause :: PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
pause = _method0 "pause"

resume :: PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
resume = _method0 "resume"

-- Arcade World
getArcadeWorld :: PhaserPhysicsPlugin -> Effect PhaserArcadeWorld
getArcadeWorld = _getProp "world"

isPaused :: PhaserArcadeWorld -> Effect Boolean
isPaused = _getProp "isPaused"

pauseWorld :: PhaserArcadeWorld -> Effect PhaserArcadeWorld
pauseWorld = _method0 "pause"

resumeWorld :: PhaserArcadeWorld -> Effect PhaserArcadeWorld
resumeWorld = _method0 "resume"
