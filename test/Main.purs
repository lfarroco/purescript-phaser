module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Class.Console (log)
import Graphics.Phaser.CoreTypes (class EventEmitter, class GameObject, class HasNodeEventEmitter, class Transform, EventListener)
import Graphics.Phaser.Events (getEventEmitter, on)
import Graphics.Phaser.ForeignTypes as FT
import Graphics.Phaser.GameObject (setName, setPosition)

gameObjectSpec ::
  FT.PhaserImage ->
  FT.PhaserContainer ->
  FT.PhaserGraphic ->
  FT.PhaserSprite ->
  FT.PhaserImage ->
  FT.ArcadeImage ->
  FT.ArcadeSprite ->
  FT.PhaserText ->
  Effect Unit
gameObjectSpec img container graphic sprite image arcadeImage arcadeSprite text =
  let
    isGameObject :: forall gameObject. GameObject gameObject => gameObject -> Effect Unit
    isGameObject = setName "" >=> const (pure unit)
  in
    do
      isGameObject img
      isGameObject container
      isGameObject graphic
      isGameObject sprite
      isGameObject image
      isGameObject arcadeImage
      isGameObject arcadeSprite
      isGameObject text

transformSpec ::
  FT.PhaserImage ->
  FT.PhaserContainer ->
  FT.PhaserGraphic ->
  FT.PhaserSprite ->
  FT.PhaserImage ->
  FT.ArcadeImage ->
  FT.ArcadeSprite ->
  FT.PhaserText ->
  Effect Unit
transformSpec img container graphic sprite image arcadeImage arcadeSprite text =
  let
    isTransform :: forall transform. Transform transform => transform -> Effect Unit
    isTransform = setPosition { x: 0.0, y: 0.0 } >=> const (pure unit)
  in
    do
      isTransform img
      isTransform container
      isTransform graphic
      isTransform sprite
      isTransform image
      isTransform arcadeImage
      isTransform arcadeSprite
      isTransform text

extendsEventEmitterSpec ::
  EventListener ->
  FT.PhaserImage ->
  FT.PhaserContainer ->
  FT.PhaserGraphic ->
  FT.PhaserSprite ->
  FT.PhaserImage ->
  FT.ArcadeImage ->
  FT.ArcadeSprite ->
  FT.PhaserText ->
  FT.Key ->
  Effect Unit
extendsEventEmitterSpec listener img container graphic sprite image arcadeImage arcadeSprite text key =
  let
    extendsEE :: forall ee. EventEmitter ee => ee -> Effect Unit
    extendsEE = on "" listener >=> const (pure unit)
  in
    do
      extendsEE img
      extendsEE container
      extendsEE graphic
      extendsEE sprite
      extendsEE image
      extendsEE arcadeImage
      extendsEE arcadeSprite
      extendsEE text
      extendsEE key

hasEventEmitterSpec ::
  FT.PhaserScene ->
  FT.PhaserGame ->
  FT.PhaserDisplayList ->
  FT.PhaserGameObjectCreator ->
  FT.PhaserGameObjectFactory ->
  FT.PhaserLayer ->
  FT.PhaserGamePad ->
  FT.PhaserGamePadButton ->
  FT.PhaserSystems ->
  FT.PhaserCache ->
  Effect Unit
hasEventEmitterSpec scene game displayList gameObjectCreator gameObjectFactory layer gamepad gamepadButton systems cache =
  let
    hasEE :: forall a. HasNodeEventEmitter a => a -> Effect Unit
    hasEE = getEventEmitter >=> const (pure unit)
  in
    do
      hasEE scene
      hasEE game
      hasEE displayList
      hasEE gameObjectCreator
      hasEE gameObjectFactory
      hasEE layer
      hasEE gamepad
      hasEE gamepadButton
      hasEE systems
      hasEE cache

-- | If the functions defined above are wrong, then the test will fail
main :: Effect Unit
main = do
  log "If you can read this, implementation follows spec 😌"
