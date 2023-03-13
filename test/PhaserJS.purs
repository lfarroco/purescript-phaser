module Test.PhaserJS where

import Prelude
import Data.Foreign.SmallFFI (unsafeForeignProcedure)
import Effect (Effect)
import Graphics.Phaser (addScene)
import Graphics.Phaser as Phaser
import Graphics.Phaser.Events (createEventListener0, getEventEmitter, on)
import Graphics.Phaser.ForeignTypes (PhaserGame, PhaserScene)
import Graphics.Phaser.Scene as Scene
import Graphics.Phaser.GameConfig as Config

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
    config = Config.width 800.0
        <> Config.height 600.0
        <> Config.physics physicsConfig'
        <> Config.type_ 3 -- HEADLESS
        <> Config.audio false
        <> Config.banner
            { background: []
            , hidePhaser: true
            , text: ""
            }
  in
    do
      Phaser.createWithConfig config
  where
  physicsConfig' =
    Config.defaultPhysicsConfig "arcade"
      <> (Config.arcade { debug: false, gravity: { x: 0.0, y: 0.0 } })
