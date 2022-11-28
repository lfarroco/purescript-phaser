module Test.PhaserJS where

import Prelude
import Data.Foreign.SmallFFI (unsafeForeignProcedure)
import Effect (Effect)
import Graphics.Phaser (addScene)
import Graphics.Phaser as Phaser
import Graphics.Phaser.Events (createEventListener0, getEventEmitter, on)
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserScene)
import Graphics.Phaser.Scene as Scene

foreign import phaserJS :: Effect Unit

runTestScene :: PhaserGame -> PhaserScene -> Effect Unit
runTestScene game scn = do
  void
    $ Scene.init
        ( \scene -> do
            plugin <- Scene.getScenePlugin scene
            emm <- getEventEmitter scene
            k <- Scene.getKey scn
            void
              $ on "test-complete"
                  ( createEventListener0
                      ( ( do
                            void $ Scene.remove k plugin
                            unsafeForeignProcedure [] "process.exit(0)"
                        )
                      )
                  )
                  emm
        )
        scn
  void $ addScene "test" game scn true {}
  pure unit

testGame :: Effect PhaserGame
testGame =
  let
    config =
      Phaser.config.width 800.0
        <> Phaser.config.height 600.0
        <> Phaser.config.physics physicsConfig'
        <> Phaser.config.type_ 3 -- HEADLESS
        <> Phaser.config.audio false
        <> Phaser.config.banner
            { background: []
            , hidePhaser: true
            , text: ""
            }
  in
    do
      Phaser.createWithConfig config
  where
  physicsConfig' =
    Phaser.physicsConfig.default "arcade"
      <> (Phaser.physicsConfig.arcade { debug: false, gravity: { x: 0.0, y: 0.0 } })
