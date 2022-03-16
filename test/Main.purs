module Test.Main where

import Prelude
import Effect (Effect)
import Effect.Class.Console (log)
import Graphics.Phaser.CoreTypes (ArcadeImage, ArcadeSprite, EventListener)
import Graphics.Phaser.Events (on)
import Graphics.Phaser.ForeignTypes (Key, PhaserContainer, PhaserGraphic, PhaserImage, PhaserSprite, PhaserText)
import Graphics.Phaser.GameObject (getPosition, setName)
import Unsafe.Coerce (unsafeCoerce)

fakeImage :: PhaserImage
fakeImage = unsafeCoerce {}

fakeContainer :: PhaserContainer
fakeContainer = unsafeCoerce {}

fakeText :: PhaserText
fakeText = unsafeCoerce {}

fakeGraphic :: PhaserGraphic
fakeGraphic = unsafeCoerce {}

fakeSprite :: PhaserSprite
fakeSprite = unsafeCoerce {}

fakeArcadeImage :: ArcadeImage
fakeArcadeImage = unsafeCoerce {}

fakeArcadeSprite :: ArcadeSprite
fakeArcadeSprite = unsafeCoerce {}

fakeKey :: Key
fakeKey = unsafeCoerce {}

-- Functions that ask for a "GameObject" should accept:
-- PhaserImage
-- PhaserContainer
-- PhaserText 
-- PhaserGraphic 
-- PhaserSprite 
-- ArcadeImage 
-- ArcadeSprite 
gameObjectTest :: Effect Unit
gameObjectTest =
  let
    _img = setName "" fakeImage

    _container = setName "" fakeContainer

    _text = setName "" fakeText

    _graphic = setName "" fakeGraphic

    _sprite = setName "" fakeSprite

    _arcadeImage = setName "" fakeArcadeImage

    _arcadeSprite = setName "" fakeArcadeSprite
  in
    log "GameObjects ok"

-- GameObjects should be accepted by functions that ask for "Transform a"
transformTest :: Effect Unit
transformTest =
  let
    _img = getPosition fakeImage

    _container = getPosition fakeContainer

    _text = getPosition fakeText

    _graphic = getPosition fakeGraphic

    _sprite = getPosition fakeSprite

    _arcadeImage = getPosition fakeArcadeImage

    _arcadeSprite = getPosition fakeArcadeSprite
  in
    log "Renderable ok"

-- GameObjects should be event emmiters
fakeListener :: EventListener
fakeListener = unsafeCoerce {}

eventsTest :: Effect Unit
eventsTest =
  let
    _img = on "" fakeListener fakeImage

    _container = on "" fakeListener fakeContainer

    _text = on "" fakeListener fakeText

    _graphic = on "" fakeListener fakeGraphic

    _arcadeImage = on "" fakeListener fakeArcadeImage

    _arcadeSprite = on "" fakeListener fakeArcadeSprite

    _key = on "" fakeListener fakeKey
  in
    log "Events ok"

main :: Effect Unit
main = do
  gameObjectTest
  transformTest
  eventsTest
  log "All declarations above should compile"
