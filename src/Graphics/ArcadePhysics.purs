module Graphics.Phaser.ArcadePhysics where

-- A port of
-- https://photonstorm.github.io/phaser3-docs/Phaser.Physics.Arcade.StaticGroup.html
-- TODO: create Groups as parent of static and dynamic groups
import Effect (Effect)
import Graphics.Canvas (Dimensions)
import Graphics.Phaser.CoreTypes (class Collidable, class GameObject, class PhysicsEnabled, ArcadeImage, ArcadeSprite, StaticGroup, Vector)
import Graphics.Phaser.ForeignTypes (PhaserScene)
import Utils.FFI (get, method0, method1, method2, return0, return2)

-- All Game Objects created by or added to this Group will automatically be given static Arcade Physics bodies, if they have no body.
createStaticGroup :: PhaserScene -> Effect StaticGroup
createStaticGroup = return0 "physics.add.staticGroup()"

createChild :: Vector -> String -> StaticGroup -> Effect ArcadeSprite
createChild = return2 "create(v1.x,v1.y,v2)"

addChild :: forall a. GameObject a => a -> StaticGroup -> Effect StaticGroup
addChild = method1 "add(v1)"

createArcadeImage :: Vector -> String -> PhaserScene -> Effect ArcadeImage
createArcadeImage = return2 "physics.add.image(v1.x,v1.y,v2)"

createArcadeSprite :: Vector -> String -> PhaserScene -> Effect ArcadeSprite
createArcadeSprite = return2 "physics.add.sprite(v1.x,v1.y,v2)"

setWorldBounds :: Vector -> Dimensions -> PhaserScene -> Effect PhaserScene
setWorldBounds = method2 "physics.world.setWorldBounds(v1.x,v1.y,v2.width,v2.height)"

refreshBody :: forall a. PhysicsEnabled a => a -> Effect a
refreshBody = method0 "refreshBody()"

setImmovable :: forall a. PhysicsEnabled a => Boolean -> a -> Effect a
setImmovable = method1 "setImmovable(v1)"

allowGravity :: forall a. PhysicsEnabled a => a -> Effect Boolean
allowGravity = get "body.allowGravity"

setAllowGravity :: forall a. PhysicsEnabled a => Boolean -> a -> Effect a
setAllowGravity = method1 "body.setAllowGravity(v1)"

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

addCollider :: forall a b. Collidable a => Collidable b => a -> b -> PhaserScene -> Effect PhaserScene
addCollider = method2 "physics.add.collider(v1,v2)"

type ArcadeBodyCollision
  = { none :: Boolean
    , up :: Boolean
    , down :: Boolean
    , left :: Boolean
    , right :: Boolean
    }

getTouching :: forall a. PhysicsEnabled a => a -> Effect ArcadeBodyCollision
getTouching = get "body.touching"
