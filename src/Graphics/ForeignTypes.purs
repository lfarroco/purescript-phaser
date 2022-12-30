module Graphics.Phaser.ForeignTypes where

import Prelude

-- https://photonstorm.github.io/phaser3-docs/Phaser.html
foreign import data PhaserMainNamespace :: Type

foreign import data PhaserGame :: Type

-- https://photonstorm.github.io/phaser3-docs/Phaser.GameObjects.GameObject.html
-- Generic game object class
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

foreign import data PhaserPointer :: Type

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

foreign import data PhaserEvents :: Type

foreign import data PhaserDataManager :: Type

foreign import data Group :: Type

foreign import data StaticGroup :: Type

foreign import data ArcadeImage :: Type

foreign import data ArcadeSprite :: Type

foreign import data PhaserArcadeWorld :: Type

foreign import data PhaserGameObjectCreator :: Type

foreign import data PhaserGameObjectFactory :: Type

foreign import data PhaserGamePad :: Type

foreign import data PhaserGamePadButton :: Type

foreign import data PhaserDisplayList :: Type

foreign import data PhaserSystems :: Type

foreign import data PhaserCache :: Type

foreign import data PhaserScenePlugin :: Type

foreign import data PhaserPhysicsPlugin :: Type

foreign import data PhaserClock :: Type

foreign import data PhaserInputPlugin :: Type

foreign import data PhaserTilemapObjectLayer :: Type

foreign import data PhaserTiledObject :: Type

foreign import data PhaserTiledObjectProperty :: Type

foreign import data PhaserLoaderPlugin :: Type

foreign import data PhaserLightsManager :: Type

foreign import data PhaserLight:: Type

foreign import data PhaserRGB :: Type

foreign import data PhaserTweenManager :: Type

instance Show PhaserTweenManager where
  show _ = "PhaserTweenManager"

instance Show PhaserLoaderPlugin  where
  show _ = "PhaserLoaderPlugin"

foreign import data PhaserLine :: Type
instance Show PhaserLine  where
  show _ = "PhaserLine"

foreign import data PhaserCurveSpline :: Type
instance Show PhaserCurveSpline   where
  show _ = "PhaserCurveSpline"

instance Show PhaserMainNamespace where
  show _ = "PhaserMainNamespace"

instance Show PhaserGame where
  show _ = "PhaserMainNamespace"

instance Show PhaserGameObject where
  show _ = "PhaserGameObject"

instance Show PhaserContainer where
  show _ = "PhaserContainer"

instance Show PhaserImage where
  show _ = "PhaserImage"

instance Show PhaserText where
  show _ = "PhaserText"

instance Show PhaserGraphic where
  show _ = "PhaserGraphic"

instance Show PhaserTween where
  show _ = "PhaserTween"

instance Show PhaserEmitter where
  show _ = "PhaserEmitter"

instance Show Event where
  show _ = "Event"

instance Show PhaserTileMap where
  show _ = "PhaserTileMap"

instance Show PhaserTile where
  show _ = "PhaserTile"

instance Show EventEmitter where
  show _ = "EventEmitter"

instance Show PhaserTileSet where
  show _ = "PhaserTileSet"

instance Show PhaserLayer where
  show _ = "PhaserLayer"

instance Show PhaserLayerData where
  show _ = "PhaserLayerData"

instance Show PhaserMapData where
  show _ = "PhaserMapData"

instance Show PhaserScene where
  show _ = "PhaserScene"

instance Show PhaserPointer where
  show _ = "PhaserPointer"

instance Show SceneManager where
  show _ = "SceneManager"

instance Show NodeEventEmitter where
  show _ = "NodeEventEmitter"

instance Show PhaserRegistry where
  show _ = "PhaserRegistry"

instance Show PhaserCamera where
  show _ = "PhaserCamera"

instance Show PhaserCameraController where
  show _ = "PhaserCameraController"

instance Show PhaserSprite where
  show _ = "PhaserSprite"

instance Show PhaserAnimation where
  show _ = "PhaserAnimation"

instance Show PhaserRectangle where
  show _ = "PhaserRectangle"

instance Show PhaserEllipse where
  show _ = "PhaserEllipse"

instance Show AudioContext where
  show _ = "AudioContext"

instance Show PluginObjectItem where
  show _ = "PluginObjectItem"

instance Show BootCallback where
  show _ = "BootCallback"

instance Show WebGLPipeline where
  show _ = "WebGLPipeline"

instance Show JSONCamera where
  show _ = "JSONCamera"

instance Show PackFileSection where
  show _ = "PackFileSection"

instance Show PhysicsImage where
  show _ = "PhysicsImage"

instance Show KeyboardPlugin where
  show _ = "KeyboardPlugin"

instance Show KeyCode where
  show _ = "KeyCode"

instance Show Key where
  show _ = "Key"

instance Show KeyBoardEvent where
  show _ = "KeyBoardEvent"

instance Show KeyBoardPlugin where
  show _ = "KeyBoardPlugin"

instance Show PhaserEvents where
  show _ = "PhaserEvents"

instance Show PhaserDataManager where
  show _ = "PhaserDataManager"

instance Show Group where
  show _ = "Group"

instance Show StaticGroup where
  show _ = "StaticGroup"

instance Show ArcadeImage where
  show _ = "ArcadeImage"

instance Show ArcadeSprite where
  show _ = "ArcadeSprite"

instance Show PhaserArcadeWorld where
  show _ = "PhaserArcadeWorld"

instance Show PhaserGameObjectCreator where
  show _ = "PhaserGameObjectCreator"

instance Show PhaserGameObjectFactory where
  show _ = "PhaserGameObjectFactory"

instance Show PhaserGamePad where
  show _ = "PhaserGamePad"

instance Show PhaserGamePadButton where
  show _ = "PhaserGamePadButton"

instance Show PhaserDisplayList where
  show _ = "PhaserDisplayList"

instance Show PhaserSystems where
  show _ = "PhaserSystems"

instance Show PhaserCache where
  show _ = "PhaserCache"

instance Show PhaserScenePlugin where
  show _ = "PhaserScenePlugin"

instance Show PhaserPhysicsPlugin where
  show _ = "PhaserPhysicsPlugin"

instance Show PhaserClock where
  show _ = "PhaserClock"

instance Show PhaserTilemapObjectLayer where
  show _ = "PhaserTilemapObjectLayer"

instance Show PhaserLightsManager  where
  show _ = "PhaserLightsManager"

instance Show PhaserLight  where
  show _ = "PhaserLight"

instance Show PhaserRGB  where
  show _ = "PhaserRGB"