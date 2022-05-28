module Main where

import Prelude
import Data.Foldable (for_)
import Effect (Effect)
import Graphics.Phaser as Phaser
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserScene)
import Graphics.Phaser.GameObject as GO
import Graphics.Phaser.Loader (loadSpritesheet)
import Graphics.Phaser.Scene as Scene
import Graphics.Phaser.Sprite as Sprite

-- | Adapted from https://phaser.io/examples/v3/view/loader/sprite-sheet/load-sprite-sheet
ghRoot :: String
ghRoot = "https://raw.githubusercontent.com/photonstorm/phaser3-examples/master/public/assets/sprites/"

main :: Effect PhaserGame
main = do
  scene <- mainScene
  Phaser.createWithConfig
    ( (Phaser.config.width 250.0)
        <> (Phaser.config.height 250.0)
        <> (Phaser.config.scene [ scene ])
    )

explodeSpriteKey :: String
explodeSpriteKey = "explosion"

explodeAnimationKey :: String
explodeAnimationKey = "explodeAnimation"

mainScene :: Effect PhaserScene
mainScene =
  do
    Scene.newScene "main"
    >>= Scene.create oncreate
    >>= Scene.preload onpreload

oncreate :: PhaserScene -> Effect PhaserScene
oncreate scene = do
  explosionFrames <- Sprite.generateFrameNumbers explodeSpriteKey 0 23 scene
  void $ Sprite.createAnimation explodeAnimationKey explosionFrames 20.0 (-1) scene
  void $ Sprite.add explodeSpriteKey { x: 100.0, y: 100.0 } scene
    >>= Sprite.playAnimation { key: explodeAnimationKey, ignoreIfPlaying: true }
    >>= scale
  void $ Sprite.add "balls" { x: 100.0, y: 100.0 } scene
    >>= Sprite.setFrame 3
    >>= scale
  pure scene
  where
  scale = GO.setScale ({ x: 3.0, y: 3.0 })

onpreload :: PhaserScene -> Effect PhaserScene
onpreload scene = do
  for_
    [ loadSpritesheet { key: "explosion", path: ghRoot <> "explosion.png" }
        { frameWidth: 64.0
        , frameHeight: 64.0
        }
    , loadSpritesheet { key: "balls", path: ghRoot <> "balls.png" }
        { frameWidth: 17.0
        , frameHeight: 17.0
        }
    ]
    (\fn -> fn scene)
  pure scene
