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

Some bindings were created using a scripts that reads Phaser's docs JsDoc and converts the definitions
to FFI bindings. Because of that, some compromises are made:

- Optinal parameters are dropped
Methods and constructors that have optinal parameters allow you to set the remaining properties after the object is created.
If we included all possible parameters, some objects like `Animation` would require 8 parameters to be created.
For cases where it is not possible to change the information after the creation, we provide an API using the `Option` type.
- Reversed keywords receive an `'` suffix
If a property, method or class have the work `type`, it will be provided as `type'`
- Parameters that receive multiple arguments will use to the first one
If a function acceps `string|string[]`, we will provide `string`.

### Compiling the examples

You can play with each example and compile it with `spago bundle-app`. You can also
run `make compile-examples` in the root directory to compile all examples.

### Octals
Use `toStringAs` to produce octal numbers (`0xffaaee`)

### Namespaces

The library is being refactored to use the same namespaces as Phaser. For example, 
the input plugin should be located on `Phaser.Input.InputPlugin`, as this is the
same location that the uses it. Recent work for that being placed in the 
`next` branch.

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
