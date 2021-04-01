module Graphics.Phaser.Tween where

import Effect (Effect)
import Phaser.Graphics.ForeignTypes (PhaserScene, PhaserTween)

-- TODO: refactor `props` to be generic record, or create a type
-- for properties that can be tweened (x, y, scale...)
-- `targets` can become an array of GameObject
foreign import addTween ::
  forall targets props.
  { scene :: PhaserScene
  , targets :: targets
  , props :: props  
  , delay :: Int
  , duration :: Number
  , ease :: String
  , repeat :: Int
  , yoyo :: Boolean
  } ->
  Effect PhaserTween
