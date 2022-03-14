module Graphics.Phaser.ForeignTypes where

import Data.Show (class Show)

foreign import data PhaserGame :: Type

-- https://photonstorm.github.io/phaser3-docs/Phaser.GameObjects.GameObject.html
foreign import data PhaserGameObject :: Type

foreign import data PhaserContainer :: Type

foreign import data PhaserImage :: Type

foreign import data PhaserText :: Type

foreign import data PhaserGraphic :: Type

foreign import data PhaserTween :: Type

foreign import data PhaserEmitter :: Type

foreign import data Event :: Type

foreign import data PhaserTileMap :: Type

foreign import data PhaserTile :: Type

foreign import data EventEmitter :: Type

foreign import data PhaserTileSet :: Type

foreign import data PhaserLayer :: Type

foreign import data PhaserLayerData :: Type

foreign import data PhaserMapData :: Type

foreign import data PhaserScene :: Type

foreign import data SceneManager :: Type

foreign import data NodeEventEmitter :: Type

foreign import data PhaserRegistry :: Type

foreign import data PhaserCamera :: Type

foreign import data PhaserCameraController :: Type

foreign import data PhaserSprite :: Type

foreign import data PhaserAnimation :: Type

foreign import data PhaserRectangle :: Type

foreign import data PhaserEllipse :: Type

foreign import data AudioContext :: Type

foreign import data PluginObjectItem :: Type

foreign import data BootCallback :: Type

foreign import data WebGLPipeline :: Type

foreign import data JSONCamera :: Type

foreign import data PackFileSection :: Type

foreign import data PhysicsImage :: Type

foreign import data KeyboardPlugin :: Type

foreign import data KeyCode :: Type

foreign import data Key :: Type

foreign import data KeyBoardEvent :: Type

foreign import data KeyBoardPlugin :: Type
