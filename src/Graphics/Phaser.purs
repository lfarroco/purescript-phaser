module Graphics.Phaser where

import Prelude
import Effect (Effect)

foreign import data PhaserGame :: Type

foreign import data PhaserTileMap :: Type

foreign import data PhaserTileSet :: Type

foreign import data PhaserLayer :: Type

foreign import createGame :: { width :: Int, height :: Int } -> Effect PhaserGame

-- foreign import addTween ::
--   forall targets props.
--   { scene :: PhaserScene
--   , targets :: targets
--   , props :: props
--   , delay :: Int
--   , duration :: Number
--   , ease :: String
--   , repeat :: Int
--   , yoyo :: Boolean
--   } ->
--   Effect PhaserImage
-- foreign import delay_ :: PhaserScene -> Int -> EffectFnAff Unit
-- foreign import destroy :: forall a. a -> Effect Unit
-- foreign import text ::
--   { scene :: PhaserScene
--   , pos :: Vector
--   , text :: String
--   , config :: { color :: String, fontSize :: Int, fontFamily :: String }
--   } ->
--   Effect PhaserText
-- delay :: PhaserScene -> Int -> Aff Unit
-- delay a = fromEffectFnAff <<< delay_ a
-- foreign import imageOnPointerUp :: PhaserImage -> (Vector -> Effect Unit) -> Effect Unit

-- foreign import setTint :: { image :: PhaserImage, color :: String } -> Effect Unit
-- foreign import clearTint :: PhaserImage -> Effect Unit
-- foreign import onUpdate :: { scene :: PhaserScene, callback :: Number -> Number -> Effect Unit } -> Effect Unit
-- foreign import removeOnUpdate :: PhaserScene -> Effect Unit
-- foreign import makeTileMap :: { scene :: PhaserScene, data :: Array (Array Int), tileWidth :: Int, tileHeight :: Int } -> Effect PhaserTileMap
-- foreign import addTilesetImage :: { tileMap :: PhaserTileMap, key :: String, tileWidth :: Int, tileHeight :: Int } -> Effect PhaserTileSet
-- foreign import createLayer :: { tileMap :: PhaserTileMap, tileset :: PhaserTileSet } -> Effect PhaserLayer
-- foreign import setMainCameraBounds :: { scene :: PhaserScene, x :: Number, y :: Number, width :: Number, height :: Number } -> Effect Unit
