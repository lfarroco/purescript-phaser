module Graphics.Phaser.Image (create, getScene) where

import Effect (Effect)
import Effect.Uncurried
  ( EffectFn1
  , EffectFn3
  , runEffectFn1
  , runEffectFn3
  )
import Graphics.Phaser.ForeignTypes (PhaserImage, PhaserScene)

-- | Create a new image in the given scene
foreign import createImpl ::
  EffectFn3
    String
    { x :: Number, y :: Number }
    PhaserScene
    PhaserImage

create ::
  String ->
  { x :: Number, y :: Number } ->
  PhaserScene ->
  Effect PhaserImage
create = runEffectFn3 createImpl

foreign import getSceneImpl :: EffectFn1 PhaserImage PhaserScene

getScene :: PhaserImage -> Effect PhaserScene
getScene = runEffectFn1 getSceneImpl
