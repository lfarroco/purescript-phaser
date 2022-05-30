module Graphics.Phaser.ArcadePhysics
  ( ArcadeBodyCollision
  , acceleration
  , accelerateTo
  , accelerateToObject
  , addChild
  , addCollider
  , addColliderWithCallback
  , addOverlap
  , addOverlapWithCallback
  , allowGravity
  , closest
  , collide
  , collideWithCallback
  , createArcadeImage
  , createArcadeSprite
  , createChild
  , createGroup
  , createStaticGroup
  , disableBody
  , furthest
  , getArcadeWorld
  , getTouching
  , isPaused
  , facing
  , moveTo
  , moveToObject
  , overlap
  , overlapWithCallback
  , pause
  , pauseWorld
  , refreshBody
  , resume
  , resumeWorld
  , setAllowGravity
  , setBounce
  , setCollideWorldBounds
  , setImmovable
  , setVelocity
  , setVelocityX
  , setVelocityY
  , setWorldBounds
  , velocity
  ) where

-- A port of
-- https://photonstorm.github.io/phaser3-docs/Phaser.Physics.Arcade.StaticGroup.html
-- TODO: create Groups as parent of static and dynamic groups
import Prelude
import Effect (Effect)
import Graphics.Canvas (Dimensions)
import Graphics.Phaser.CoreTypes (class ArcadeGroup, class Collidable, class GameObject, class PhysicsEnabled, Vector)
import Graphics.Phaser.ForeignTypes (ArcadeImage, ArcadeSprite, Group, PhaserArcadeWorld, PhaserPhysicsPlugin, PhaserScene, StaticGroup)
import Utils.FFI (_getProp, _getProperty, _method, method1, method2, method3, return2)

-- All Game Objects created by or added to this Group will automatically be given static Arcade Physics bodies, if they have no body.
createStaticGroup :: PhaserPhysicsPlugin -> Effect StaticGroup
createStaticGroup = _getProp "add" >=> _method "staticGroup" []

createGroup :: PhaserPhysicsPlugin -> Effect Group
createGroup = _getProp "add" >=> _method "group" []

createChild :: forall g. ArcadeGroup g => Vector -> String -> g -> Effect ArcadeSprite
createChild = return2 "create(v1.x,v1.y,v2)"

addChild :: forall a g. GameObject a => ArcadeGroup g => a -> g -> Effect g
addChild = method1 "add(v1)"

createArcadeImage :: Vector -> String -> PhaserPhysicsPlugin -> Effect ArcadeImage
createArcadeImage = return2 "add.image(v1.x,v1.y,v2)"

createArcadeSprite :: Vector -> String -> PhaserPhysicsPlugin -> Effect ArcadeSprite
createArcadeSprite = return2 "add.sprite(v1.x,v1.y,v2)"

setWorldBounds :: Vector -> Dimensions -> PhaserScene -> Effect PhaserScene
setWorldBounds = method2 "world.setWorldBounds(v1.x,v1.y,v2.width,v2.height)"

refreshBody :: forall a. PhysicsEnabled a => a -> Effect a
refreshBody = _method "refreshBody" []

setImmovable :: forall a. PhysicsEnabled a => Boolean -> a -> Effect a
setImmovable = method1 "setImmovable(v1)"

allowGravity :: forall a. PhysicsEnabled a => a -> Effect Boolean
allowGravity = _getProperty "body.allowGravity"

setAllowGravity :: forall a. PhysicsEnabled a => Boolean -> a -> Effect a
setAllowGravity = method1 "body.setAllowGravity(v1)"

acceleration :: forall a. PhysicsEnabled a => a -> Effect Vector
acceleration = _getProperty "body.acceleration"

facing :: forall a. PhysicsEnabled a => a -> Effect Number
facing = _getProperty "body.facing"

velocity :: forall a. PhysicsEnabled a => a -> Effect Vector
velocity = _getProperty "body.velocity"

setVelocityX :: forall a. PhysicsEnabled a => Number -> a -> Effect a
setVelocityX = method1 "body.setVelocityX(v1)"

setVelocityY :: forall a. PhysicsEnabled a => Number -> a -> Effect a
setVelocityY = method1 "body.setVelocityY(v1)"

setVelocity :: forall a. PhysicsEnabled a => Vector -> a -> Effect a
setVelocity = method1 "body.setVelocity(v1.x,v1.y)"

setBounce :: forall a. PhysicsEnabled a => Number -> a -> Effect a
setBounce = method1 "body.setVelocityY(v1)"

setCollideWorldBounds :: forall a. PhysicsEnabled a => Boolean -> a -> Effect a
setCollideWorldBounds = method1 "setCollideWorldBounds(v1)"

addCollider :: forall a b. Collidable a => Collidable b => a -> b -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
addCollider = method2 "add.collider(v1,v2)"

addColliderWithCallback :: forall a b. Collidable a => Collidable b => Array a -> Array b -> (a -> b -> Effect Unit) -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
addColliderWithCallback = method3 "add.collider(v1,v2,(a,b)=>v3(a)(b)())"

type ArcadeBodyCollision
  = { none :: Boolean
    , up :: Boolean
    , down :: Boolean
    , left :: Boolean
    , right :: Boolean
    }

getTouching :: forall a. PhysicsEnabled a => a -> Effect ArcadeBodyCollision
getTouching = _getProperty "body.touching"

addOverlap :: forall a b c d. Collidable a => Collidable b => Collidable c => Collidable d => a -> b -> (c -> d -> Effect Unit) -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
addOverlap = method3 "add.overlap(v1,v2,(a,b)=>v3(a)(b)())"

addOverlapWithCallback :: forall a b. Collidable a => Collidable b => Array a -> Array b -> (a -> b -> Effect Unit) -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
addOverlapWithCallback = method3 "add.overlap(v1,v2,(a,b)=>v3(a)(b)())"

disableBody :: forall a. PhysicsEnabled a => a -> Effect a
disableBody = _method "disableBody" [ true, true ]

accelerateTo :: forall a. GameObject a => a -> Vector -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
accelerateTo = method2 "accelerateTo(v1,v2.x,v2.y)"

accelerateToObject :: forall a b. GameObject a => GameObject b => a -> b -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
accelerateToObject = method2 "accelerateToObject(v1,v2)"

closest :: forall a. GameObject a => a -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
closest = method1 "closest(v1)"

furthest :: forall a. GameObject a => a -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
furthest = method1 "furthest(v1)"

collide :: forall a b. GameObject a => GameObject b => Array a -> Array b -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
collide = method2 "collide(v1,v2)"

collideWithCallback :: forall a b. GameObject a => GameObject b => Array a -> Array b -> (a -> b -> Effect Unit) -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
collideWithCallback = method3 "collide(v1,v2,(a,b)=>v3(a)(b)())"

moveTo :: forall a. GameObject a => a -> Vector -> Number -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
moveTo = method3 "moveTo(v1,v2.x,v2.y,v3)"

moveToObject :: forall a b. GameObject a => GameObject b => a -> b -> Number -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
moveToObject = method3 "moveTo(v1,v2,v3)"

overlap :: forall a b. GameObject a => GameObject b => Array a -> Array b -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
overlap = method2 "overlap(v1,v2)"

overlapWithCallback :: forall a b. GameObject a => GameObject b => Array a -> Array b -> (a -> b -> Effect Unit) -> PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
overlapWithCallback = method3 "overlap(v1,v2,(a,b)=>v3(a)(b)())"

pause :: PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
pause = _method "pause" []

resume :: PhaserPhysicsPlugin -> Effect PhaserPhysicsPlugin
resume = _method "resume" []

-- Arcade World
getArcadeWorld :: PhaserPhysicsPlugin -> Effect PhaserArcadeWorld
getArcadeWorld = _getProperty "world"

isPaused :: PhaserArcadeWorld -> Effect Boolean
isPaused = _getProperty "isPaused"

pauseWorld :: PhaserArcadeWorld -> Effect PhaserArcadeWorld
pauseWorld = _method "pause" []

resumeWorld :: PhaserArcadeWorld -> Effect PhaserArcadeWorld
resumeWorld = _method "resume" []
