# purescript-phaser

[![Build](https://github.com/lfarroco/purescript-phaser/actions/workflows/node.js.yml/badge.svg)](https://github.com/lfarroco/purescript-phaser/actions/workflows/node.js.yml)


```sh
spago install phaser
```

Bindings for common Phaser 3 operations. As Phaser has a large API, not everything is implemented.
Feel free to open a PR or ask for a new binding!

Some bindings allow a more FP-friendly way of handling operations,
like returning a scene or game object to allow function chaining.

This library is intended to be non-optioned so that you can build your own abstractions upon
the bindings offered here.

### Installing

Make sure to include a script tag with Phaser 3 (or add it to your bundle)
before importing your PureScript code.

## Examples

You can check our example library at https://lfarroco.github.io/purescript-phaser/.

The code for the examples is available at `/docs/examples`.

## Reasoning

Phaser's API allow doing the same thing in multiple ways, and its functions allow multiple optional
parameters.
In scenarios where you are creating an object and its optional parameters can be set after creation,
we drop the requirements.
Example:
When creating an image, we have the following parameters:
- scene
- x
- y
- texture
- frame (optional)

As it is possible using `setFrame` after creating the image, we drop the frame argument for convenience.

Sometimes this is not possible: the `Phaser.Game` class has 30 optional parameters, and depending on 
what you are trying to do (like loading a plugin or setting a specific render mode), those parameters
can only be provided during the object creation.
In these cases we use the `purescript-option` library to allow using these APIs (with the cost of verbosity).

```
import Graphics.Phaser.GameConfig as Config
...

config =  Config.width 800.0 --
       <> Config.height 600.0
...
Phaser.createWithConfig config
```

Some bindings were created using a script that reads Phaser's docs JsDoc and converts the definitions
to FFI bindings. Those bindings have a disclaimer in their header. In those cases, the following logic is used:

- tailing optional parameters are dropped
- Reserved keywords receive a `'` suffix (eg. `type` becomes `type'`)
- Parameters that receive multiple arguments types will use to the first one
If a function accepts `string|string[]`, we will provide `string`.

### Compiling the examples

You can play with each example and compile it with `spago bundle-app`. You can also
run `make compile-examples` in the root directory to compile all examples.

### Namespaces

The library is being refactored to use the same namespaces as Phaser.
The intention is to make it easier to refer to the source docs. 
Because of this, some existing namespaces may change to follow the original structure.

### Classes

| Class                                  | Support Level   | Implementation Type |
| ---                                    | ---             | ---                 |
| Animations.*                           | Implemented     | Automated           |
| Cache.*                                | 0               |                     |
| Cameras.*                              | 0               |                     |
| Core.*                                 | 0               |                     |
| Curves.*                               | 0               |                     |
| Data.*                                 | 0               |                     |
| Display.*                              | 0               |                     |
| DOM.*                                  | 0               |                     |
| Events.*                               | Partial         | Manual              |
| FacebookInstantGamesLeaderboard        | 0               |                     |
| FacebookInstantGamePlugin              | 0               |                     |
| Game                                   | Partial         | Manual              |
| GameObjects.Arc                        | 0               |                     |
| GameObjects.BitmapText                 | 0               |                     |
| GameObjects.Blitter                    | 0               |                     |
| GameObjects.Components.TransformMatrix | 0               |                     |
| GameObjects.Container                  | Partial         | Manual              |
| GameObjects.Curve                      | Partial         | Manual              |
| GameObjects.DisplayList                | 0               |                     |
| GameObjects.DOMElement                 | 0               |                     |
| GameObjects.DynamicBitmapText          | 0               |                     |
| GameObjects.Ellipse                    | 0               |                     |
| GameObjects.Extern                     | 0               |                     |
| GameObjects.GameObject                 | Partial         | Manual              |
| GameObjects.GameObjectCreator          | 0               |                     |
| GameObjects.GameObjectFactory          | 0               |                     |
| GameObjects.Graphics                   | Partial         | Manual              |
| GameObjects.Grid                       | 0               |                     |
| GameObjects.Group                      | 0               |                     |
| GameObjects.Image                      | Complete        | Manual              |
| GameObjects.IsoBox                     | Complete        | Automated           |
| GameObjects.IsoTriangle                | 0               |                     |
| GameObjects.Layer                      | 0               |                     |
| GameObjects.Light                      | Partial         | Manual              |
| GameObjects.LightsManager              | Partial         | Manual              |
| GameObjects.LightsPlugin               | Partial         |                     |
| GameObjects.Line                       | 0               |                     |
| GameObjects.Mesh                       | 0               |                     |
| GameObjects.Particles.*                | 0               |                     |
| GameObjects.PathFollower               | 0               |                     |
| GameObjects.PointLight                 | 0               |                     |
| GameObjects.Polygon                    | 0               |                     |
| GameObjects.Rectangle                  | Partial         | Manual              |
| GameObjects.RenderTexture              | 0               |                     |
| GameObjects.Rope                       | 0               |                     |
| GameObjects.Shader                     | 0               |                     |
| GameObjects.Shape                      | 0               |                     |
| GameObjects.Sprite                     | Partial         | Manual              |
| GameObjects.Sprite3D                   | 0               |                     |
| GameObjects.Star                       | 0               |                     |
| GameObjects.Text                       | Partial         | Manual              |
| GameObjects.TextStyle                  | 0               |                     |
| GameObjects.TileSprite                 | 0               |                     |
| GameObjects.Triangle                   | 0               |                     |
| GameObjects.UpdateList                 | 0               |                     |
| GameObjects.Video                      | 0               |                     |
| GameObjects.Zone                       | 0               |                     |
| Geom.Circle                            | Partial         | Manual              |
| Geom.Ellipse                           | 0               |                     |
| Geom.Line                              | 0               |                     |
| Geom.Mesh.Face                         | 0               |                     |
| Geom.Mesh.Vertex                       | 0               |                     |
| Geom.Point                             | 0               |                     |
| Geom.Polygon                           | 0               |                     |
| Geom.Rectangle                         | Partial         | Manual              |
| Geom.Triangle                          | 0               |                     |
| Input.*                                | Partial         | Manual              |
| Loader.*                               | 0               |                     |
| Math.*                                 | 0               |                     |
| Physics.*                              | Partial         | Manual              |
| Plugins.*                              | Partial         | Manual              |
| Renderer.*                             | 0               |                     |
| Scale.*                                | 0               |                     |
| Scene                                  | Partial         | Manual              |
| Scenes.*                               | Partial         | Manual              |
| Sound.*                                | 0               |                     |
| Structs.*                              | 0               |                     |
| Textures.*                             | 0               |                     |
| Tilemaps.*                             | Partial         | Manual              |
| Time.*                                 | 0               |                     |
| Tweens.*                               | Partial         | Manual              |
| SpineContainer                         | 0               |                     |
