module Main where

import Prelude
import Effect (Effect)
import Effect.Class.Console (log)
import Graphics.Phaser as Phaser
import Graphics.Phaser.Events (createEventListener0, on)
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserImage, PhaserScene)
import Graphics.Phaser.GameObject (setAngle, setDisplaySize, setInteractive, setPosition)
import Graphics.Phaser.Image as Image
import Graphics.Phaser.Loader (loadImage)
import Graphics.Phaser.Scene as Scene
import Graphics.Phaser.Text as Text

main :: Effect PhaserGame
main = do
  main' <- mainScene
  snd' <- secondScene
  Phaser.create
    >>= Phaser.setDimentions { width: 400.0, height: 400.0 }
    >>= Phaser.addScene "main" main' true
    >>= Phaser.addScene "snd" snd' false

mainScene :: Effect PhaserScene
mainScene =
  do
    Scene.newScene "main"
    >>= Scene.create
        ( \_data scene -> do
            void $ Text.create "Click the logo to create a new scene" scene
            void $ startButton scene
        )
    >>= Scene.preload
        ( \scene ->
            void do
              loadImage
                { key: "logo"
                , path: "https://upload.wikimedia.org/wikipedia/commons/6/64/PureScript_Logo.png"
                }
                scene
        )
  where
  startButton scene =
    Image.create "logo" scene
      >>= setPosition { x: 100.0, y: 100.0 }
      >>= setDisplaySize { width: 50.0, height: 50.0 }
      >>= setInteractive
      >>= on "pointerdown" listener
    where
    callback :: Effect Unit
    callback =
      void do
        log "clicked!"
        -- Don't do anything with the image, just launch a new scene.
        Scene.getScenePlugin scene >>= Scene.launch "snd" {}

    listener = createEventListener0 callback

secondScene :: Effect PhaserScene
secondScene = do
  Scene.newScene "snd"
    >>= Scene.create (\_data scene -> void do createLogo scene)
  where
  createLogo :: PhaserScene -> Effect PhaserImage
  createLogo =
    Image.create "logo"
      >=> setPosition { x: 200.0, y: 200.0 }
      >=> setAngle 30.0
      >=> setDisplaySize { width: 50.0, height: 50.0 }
