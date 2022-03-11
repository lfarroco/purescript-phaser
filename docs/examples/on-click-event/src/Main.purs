module Main where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Class.Console (log)
import Graphics.Phaser as Phaser
import Graphics.Phaser.CoreTypes (Vector)
import Graphics.Phaser.Events (EventListener, createEventListener3, off, onListener)
import Graphics.Phaser.ForeignTypes (PhaserImage, PhaserScene)
import Graphics.Phaser.GameObject as GO
import Graphics.Phaser.Image as Image
import Graphics.Phaser.Loader (loadImages)
import Graphics.Phaser.Scene (getChildByName)
import Graphics.Phaser.SceneManager (Start(..), addScene)
import Graphics.Phaser.Text as Text

logoPath :: String
logoPath = "https://upload.wikimedia.org/wikipedia/commons/6/64/PureScript_Logo.png"

main :: Effect Unit
main =
  void do
    game <- Phaser.create { width: 400.0, height: 300.0 }
    addScene "main" mainScene Start game

mainScene ::
  { create :: PhaserScene -> Effect Unit
  , preload :: PhaserScene -> Effect Unit
  }
mainScene =
  { create:
      \scene ->
        void do
          title scene
          startButton scene
  , preload:
      loadImages [ { key: "logo", path: logoPath } ]
  }
  where
  title scene = void do Text.create "Click the logo to trigger an event." scene
  startButton :: PhaserScene -> Effect Unit
  startButton scene = void do
    image <-
      Image.create "logo" scene
        >>= GO.setPosition { x: 100.0, y: 100.0 }
        >>= GO.setDisplaySize { width: 50.0, height: 50.0 }
        >>= GO.setInteractive
        >>= GO.setName "clickable_image"
    onListener "pointerdown" listener image
    where
    listener :: EventListener
    listener = createEventListener3 callback
    callback :: Vector -> String -> String -> Effect Unit
    callback pointer localX localY= do
      log $ show pointer
      log localX
      log localY
      _ <- Image.create "logo" scene
          >>= GO.setPosition { x: 200.0, y: 200.0 }
          >>= GO.setDisplaySize { width: 150.0, height: 150.0 }
      clickable <- getImageByName "clickable_image" scene
      case clickable of
            Just img -> void do off "pointerdown" img
            Nothing -> log "Clickable image not found"
      pure unit

getImageByName :: String -> PhaserScene -> Effect (Maybe PhaserImage)
getImageByName = getChildByName 
