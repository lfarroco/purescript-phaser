module Graphics.Phaser.Input.InputPlugin where

--
-- https://newdocs.phaser.io/docs/3.55.2/Phaser.Input.InputPlugin
-- Status: Incomplete
--
import Prelude
import Effect (Effect)
import Graphics.Phaser.CoreTypes (class GameObject, EventListener)
import Graphics.Phaser.Events (createEventListener2, on)
import Graphics.Phaser.ForeignTypes (Key, KeyBoardEvent, KeyBoardPlugin, KeyCode, PhaserInputPlugin, PhaserScene)
import Utils.FFI (_getProp, _method0, _method1, _return0, _return1, _setProp)

getInputPlugin :: PhaserScene -> Effect PhaserInputPlugin
getInputPlugin = _getProp "input"

setDraggable :: forall a. GameObject a => a -> PhaserInputPlugin -> Effect PhaserInputPlugin
setDraggable = _method1 "setDraggable"

setDropZone :: forall a. GameObject a => Boolean -> a -> Effect a
setDropZone bool go = do
  void $ _getProp "input" go >>= _setProp "dropZone" bool 
  pure go

setDragTimeThreshold :: Number -> PhaserInputPlugin -> Effect PhaserInputPlugin 
setDragTimeThreshold = _setProp "dragTimeThreshold"

setDragDistanceThreshold :: Number -> PhaserInputPlugin -> Effect PhaserInputPlugin 
setDragDistanceThreshold = _setProp "dragDistanceThreshold"

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
createCursorKeys =
  _getProp "input"
    >=> _getProp "keyboard"
    >=> _return0 "createCursorKeys"

addKey :: Effect KeyCode -> PhaserScene -> Effect CursorKeys
addKey v1 =
  _getProp "input"
    >=> _getProp "keyboard"
    >=> _return1 "addKey" v1

altKey :: Key -> Effect Boolean
altKey = _getProp "altKey"

ctrlKey :: Key -> Effect Boolean
ctrlKey = _getProp "ctrlKey"

duration :: Key -> Effect Number
duration = _getProp "duration"

emitOnRepeat :: Key -> Effect Boolean
emitOnRepeat = _getProp "emitOnRepeat"

setEmitOnRepeat :: Boolean -> Key -> Effect Key
setEmitOnRepeat = _method1 "emitOnRepeat"

enabled :: Key -> Effect Boolean
enabled = _getProp "enabled"

isDown :: Key -> Effect Boolean
isDown = _getProp "isDown"

isUp :: Key -> Effect Boolean
isUp = _getProp "isUp"

reset :: Key -> Effect Key
reset = _method0 "reset"

keyCode :: Key -> Effect Number
keyCode = _getProp "keyCode"

-- "The location of the modifier key. 0 for standard (or unknown), 1 for left, 2 for right, 3 for numpad."
location :: Key -> Effect Number
location = _getProp "location"

-- "The down state of the Meta key, if pressed at the same time as this key. On a Mac the Meta Key is the Command key. On Windows keyboards, it's the Windows key."
metaKey :: Key -> Effect Boolean
metaKey = _getProp "metaKey"

-- "The Keyboard Plugin instance that owns this Key object."
plugin :: Key -> Effect KeyBoardPlugin
plugin = _getProp "plugin"

-- "If a key is held down this holds down the number of times the key has 'repeated'."
repeats :: Key -> Effect Number
repeats = _getProp "repeats"

-- "The down state of the SHIFT key, if pressed at the same time as this key."
shiftKey :: Key -> Effect Boolean
shiftKey = _getProp "shiftKey"

-- "The timestamp when the key was last pressed down."
timeDown :: Key -> Effect Boolean
timeDown = _getProp "timeDown"

-- "The timestamp when the key was last released."
timeUp :: Key -> Effect Boolean
timeUp = _getProp "timeUp"

-- ## Events ##
--
-- "Returns the duration, in ms, that the Key has been held down for."
getDuration :: Key -> Effect Number
getDuration = _return0 "getDuration"

-- "Processes the Key Down action for this Key. Called automatically by the Keyboard Plugin."
onDown :: KeyBoardEvent -> Key -> Effect Key
onDown = _method1 "onDown"

-- "Processes the Key Up action for this Key. Called automatically by the Keyboard Plugin."
onUp :: KeyBoardEvent -> Key -> Effect Key
onUp = _method1 "onUp"

-- DOM Event Helpers
stopPropagation :: KeyBoardEvent -> Effect KeyBoardEvent
stopPropagation = _method0 "stopPropagation"

stopImmediatePropagation :: KeyBoardEvent -> Effect KeyBoardEvent
stopImmediatePropagation = _method0 "stopImmediatePropagation"

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
