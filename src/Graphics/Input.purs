module Graphics.Phaser.Input where

-- Related docs:
-- https://photonstorm.github.io/phaser3-docs/Phaser.Input.Keyboard.KeyboardPlugin.html
-- https://photonstorm.github.io/phaser3-docs/Phaser.Input.Keyboard.Key.html
import Prelude
import Effect (Effect)
import Graphics.Phaser.CoreTypes (EventListener)
import Graphics.Phaser.Events (createEventListener2, on)
import Graphics.Phaser.ForeignTypes (Key, KeyBoardEvent, KeyBoardPlugin, KeyCode, PhaserScene)
import Utils.FFI (getProperty, method0, method1, return0, return1)

type CursorKeys
  = { up :: Key
    , down :: Key
    , left :: Key
    , right :: Key
    , space :: Key
    , shift :: Key
    }

-- TODO: create typeclass for the Input Plugin
-- so that keys can be created outside of scenes
createCursorKeys :: PhaserScene -> Effect CursorKeys
createCursorKeys = return0 "input.keyboard.createCursorKeys()"

addKey :: KeyCode -> PhaserScene -> Effect CursorKeys
addKey = return1 "input.keyboard.addKey(v1)"

altKey :: Key -> Effect Boolean
altKey = getProperty "altKey"

ctrlKey :: Key -> Effect Boolean
ctrlKey = getProperty "ctrlKey"

duration :: Key -> Effect Number
duration = getProperty "duration"

emitOnRepeat :: Key -> Effect Boolean
emitOnRepeat = getProperty "emitOnRepeat"

setEmitOnRepeat :: Boolean -> Key -> Effect Key
setEmitOnRepeat = method1 "emitOnRepeat(v1)"

enabled :: Key -> Effect Boolean
enabled = getProperty "enabled"

isDown :: Key -> Effect Boolean
isDown = getProperty "isDown"

isUp :: Key -> Effect Boolean
isUp = getProperty "isUp"

reset :: Key -> Effect Key
reset = method0 "reset()"

keyCode :: Key -> Effect Number
keyCode = getProperty "keyCode"

-- "The location of the modifier key. 0 for standard (or unknown), 1 for left, 2 for right, 3 for numpad."
location :: Key -> Effect Number
location = getProperty "location"

-- "The down state of the Meta key, if pressed at the same time as this key. On a Mac the Meta Key is the Command key. On Windows keyboards, it's the Windows key."
metaKey :: Key -> Effect Boolean
metaKey = getProperty "metaKey"

-- "The Keyboard Plugin instance that owns this Key object."
plugin :: Key -> Effect KeyBoardPlugin
plugin = getProperty "plugin"

-- "If a key is held down this holds down the number of times the key has 'repeated'."
repeats :: Key -> Effect Number
repeats = getProperty "repeats"

-- "The down state of the SHIFT key, if pressed at the same time as this key."
shiftKey :: Key -> Effect Boolean
shiftKey = getProperty "shiftKey"

-- "The timestamp when the key was last pressed down."
timeDown :: Key -> Effect Boolean
timeDown = getProperty "timeDown"

-- "The timestamp when the key was last released."
timeUp :: Key -> Effect Boolean
timeUp = getProperty "timeUp"

-- ## Events ##
--
-- "Returns the duration, in ms, that the Key has been held down for."
getDuration :: Key -> Effect Number
getDuration = return0 "getDuration()"

-- "Processes the Key Down action for this Key. Called automatically by the Keyboard Plugin."
onDown :: KeyBoardEvent -> Key -> Effect Key
onDown = method1 "onDown(v1)"

-- "Processes the Key Up action for this Key. Called automatically by the Keyboard Plugin."
onUp :: KeyBoardEvent -> Key -> Effect Key
onUp = method1 "onUp(v1)"

-- DOM Event Helpers
stopPropagation :: KeyBoardEvent -> Effect KeyBoardEvent
stopPropagation = method0 "stopPropagation()"

stopImmediatePropagation :: KeyBoardEvent -> Effect KeyBoardEvent
stopImmediatePropagation = method0 "stopImmediatePropagation()"

-- ### Key up/down Events
-- reference: https://rexrainbow.github.io/phaser3-rex-notes/docs/site/keyboardevents/
type KeyDownListener
  = EventListener

createKeyDownListener :: (Key -> KeyBoardEvent -> Effect Unit) -> KeyDownListener
createKeyDownListener = createEventListener2

onKeyDown :: KeyDownListener -> Key -> Effect Key
onKeyDown = on "down"

type KeyUpListener
  = EventListener

createKeyUpListener :: (Key -> KeyBoardEvent -> Effect Unit) -> KeyUpListener
createKeyUpListener = createEventListener2

onKeyUp :: KeyUpListener -> Key -> Effect Key
onKeyUp = on "up"
