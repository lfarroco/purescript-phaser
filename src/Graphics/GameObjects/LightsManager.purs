module Graphics.Phaser.GameObjects.LightsManager where

--
-- https://newdocs.phaser.io/docs/3.55.1/Phaser.GameObjects.LightsManager
-- Status: Complete
--
import Prelude
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserCamera, PhaserLight, PhaserLightsManager, PhaserRGB, PhaserScene)
import Utils.FFI (_getProp, _method0, _method1, _return0, _return1, _return5, _return6)

lightsManager :: PhaserScene -> Effect PhaserLightsManager
lightsManager = _getProp "lights"

active :: PhaserLightsManager -> Effect Boolean
active = _getProp "active"

ambientColor :: PhaserLightsManager -> Effect PhaserRGB
ambientColor = _getProp "ambientColor"

lights :: PhaserLightsManager -> Effect (Array PhaserLight)
lights = _getProp "lights"

maxLights :: PhaserLightsManager -> Effect Number
maxLights = _getProp "maxLights"

visibleLights :: PhaserLightsManager -> Effect Number
visibleLights = _getProp "visibleLights"

-- https://newdocs.phaser.io/docs/3.55.1/Phaser.GameObjects.LightsManager#addLight
addLight :: Number -> Number -> Number -> String -> Number -> PhaserLightsManager -> Effect PhaserLight
addLight = _return5 "addLight"

-- https://newdocs.phaser.io/docs/3.55.1/Phaser.GameObjects.LightsManager#addPointLight
addPointLight :: Number -> Number -> String -> Number -> Number -> Number -> PhaserLightsManager -> Effect PhaserLight
addPointLight = _return6 "addPointLight"

destroy :: PhaserLightsManager -> Effect Unit
destroy el = do
  _ <- _method0 "destroy" el
  pure unit

disable :: PhaserLightsManager -> Effect PhaserLightsManager
disable = _method0 "disable"

enable :: PhaserLightsManager -> Effect PhaserLightsManager
enable = _method0 "enable"

getLightCount :: PhaserLightsManager -> Effect Number
getLightCount = _return0 "getLightCount"

getLights :: PhaserCamera -> PhaserLightsManager -> Effect (Array PhaserLight)
getLights = _return1 "getLights"

getMaxVisibleLights :: PhaserLightsManager -> Effect Number
getMaxVisibleLights = _return0 "getMaxVisibleLights"

removeLight :: PhaserLight -> PhaserLightsManager -> Effect PhaserLightsManager
removeLight = _method1 "removeLight"

setAmbientColor :: PhaserRGB -> PhaserLightsManager -> Effect PhaserLightsManager
setAmbientColor = _method1 "setAmbientColor"

shutdown :: PhaserLightsManager -> Effect PhaserLightsManager
shutdown = _method0 "shutdown"
