module Graphics.Phaser.GameObjects.IsoBox where

-- | (Mostly) autogenerated from https://raw.githubusercontent.com/photonstorm/phaser/master/src/gameobjects/shape/isobox/IsoBox.js
import Prelude
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (PhaserScene)
import Graphics.Phaser.GameObjects (gameObjects)
import Utils.FFI (_getProp, _method0, _method1, _new1)

foreign import data IsoBox :: Type

-- | The IsoBox Shape is a Game Object that can be added to a Scene, Group or Container. You can
-- | treat it like any other Game Object in your game, such as tweening it, scaling it, or enabling
-- | it for input or physics. It provides a quick and easy way for you to render this shape in your
-- | game without using a texture, while still taking advantage of being fully batched in WebGL.
-- | 
-- | This shape supports only fill colors and cannot be stroked.
-- | 
-- | An IsoBox is an 'isometric' rectangle. Each face of it has a different fill color. You can set
-- | the color of the top, left and right faces of the rectangle respectively. You can also choose
-- | which of the faces are rendered via the `showTop`, `showLeft` and `showRight` properties.
-- | 
-- | You cannot view an IsoBox from under-neath, however you can change the 'angle' by setting
-- | the `projection` property.
new :: PhaserScene -> Effect IsoBox
new scene = do
  namespace <- gameObjects >>= _getProp "IsoBox"
  _new1 namespace scene

-- | The projection level of the iso box. Change this to change the 'angle' at which you are looking at the box.
projection :: IsoBox -> Effect Number
projection = _getProp "projection"

-- | The color used to fill in the top of the iso box.
fillTop :: IsoBox -> Effect Number
fillTop = _getProp "fillTop"

-- | The color used to fill in the left-facing side of the iso box.
fillLeft :: IsoBox -> Effect Number
fillLeft = _getProp "fillLeft"

-- | The color used to fill in the right-facing side of the iso box.
fillRight :: IsoBox -> Effect Number
fillRight = _getProp "fillRight"

-- | Controls if the top-face of the iso box be rendered.
showTop :: IsoBox -> Effect Boolean
showTop = _getProp "showTop"

-- | Controls if the left-face of the iso box be rendered.
showLeft :: IsoBox -> Effect Boolean
showLeft = _getProp "showLeft"

-- | Controls if the right-face of the iso box be rendered.
showRight :: IsoBox -> Effect Boolean
showRight = _getProp "showRight"

-- | Sets the projection level of the iso box. Change this to change the 'angle' at which you are looking at the box.
-- | This call can be chained.
-- | Parameters:
-- |     value - Number - The value to set the projection to.
-- |
setProjection :: Number -> IsoBox -> Effect IsoBox
setProjection = _method1 "setProjection"

-- | Sets which faces of the iso box will be rendered.
-- | This call can be chained.
-- |
setFaces :: IsoBox -> Effect IsoBox
setFaces = _method0 "setFaces"

-- | Sets the fill colors for each face of the iso box.
-- | This call can be chained.
-- |
setFillStyle :: IsoBox -> Effect IsoBox
setFillStyle = _method0 "setFillStyle"
