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

| Class                                  | Support Level   |
| ---                                    | ---             |
| Animations.*                           | Implemented     |
| Cache.*                                | Not Implemented |
| Cameras.*                              | Partial         |
| Core.*                                 | Partial         |
| Curves.*                               | Partial         |
| Data.*                                 | Partial         |
| Display.*                              | Partial         |
| DOM.*                                  | Partial         |
| Events.*                               | Partial         |
| FacebookInstantGamesLeaderboard        | Partial         |
| FacebookInstantGamePlugin              | Partial         |
| Game                                   | Partial         |
| GameObjects.Arc                        | Partial         |
| GameObjects.BitmapText                 | Partial         |
| GameObjects.Blitter                    | Partial         |
| GameObjects.Components.TransformMatrix | Partial         |
| GameObjects.Container                  | Partial         |
| GameObjects.Curve                      | Partial         |
| GameObjects.DisplayList                | Partial         |
| GameObjects.DOMElement                 | Partial         |
| GameObjects.DynamicBitmapText          | Partial         |
| GameObjects.Ellipse                    | Partial         |
| GameObjects.Extern                     | Partial         |
| GameObjects.GameObject                 | Partial         |
| GameObjects.GameObjectCreator          | Partial         |
| GameObjects.GameObjectFactory          | Partial         |
| GameObjects.Graphics                   | Partial         |
| GameObjects.Grid                       | Partial         |
| GameObjects.Group                      | Partial         |
| GameObjects.Image                      | Complete        |
| GameObjects.IsoBox                     | Partial         |
| GameObjects.IsoTriangle                | Partial         |
| GameObjects.Layer                      | Partial         |
| GameObjects.Light                      | Partial         |
| GameObjects.LightsManager              | Partial         |
| GameObjects.LightsPlugin               | Partial         |
| GameObjects.Line                       | Partial         |
| GameObjects.Mesh                       | Partial         |
| GameObjects.Particles.*                | Partial         |
| GameObjects.PathFollower               | Partial         |
| GameObjects.PointLight                 | Partial         |
| GameObjects.Polygon                    | Partial         |
| GameObjects.Rectangle                  | Partial         |
| GameObjects.RenderTexture              | Partial         |
| GameObjects.Rope                       | Partial         |
| GameObjects.Shader                     | Partial         |
| GameObjects.Shape                      | Partial         |
| GameObjects.Sprite                     | Partial         |
| GameObjects.Sprite3D                   | Partial         |
| GameObjects.Star                       | Partial         |
| GameObjects.Text                       | Partial         |
| GameObjects.TextStyle                  | Partial         |
| GameObjects.TileSprite                 | Partial         |
| GameObjects.Triangle                   | Partial         |
| GameObjects.UpdateList                 | Partial         |
| GameObjects.Video                      | Partial         |
| GameObjects.Zone                       | Partial         |
| Geom.Circle                            | Partial         |
| Geom.Ellipse                           | Partial         |
| Geom.Line                              | Partial         |
| Geom.Mesh.Face                         | Partial         |
| Geom.Mesh.Vertex                       | Partial         |
| Geom.Point                             | Partial         |
| Geom.Polygon                           | Partial         |
| Geom.Rectangle                         | Partial         |
| Geom.Triangle                          | Partial         |
| Input.*                                | Partial         |
| Loader.*                               | Partial         |
| Math.*                                 | Partial         |
| Physics.*                              | Partial         |
| Plugins.*                              | Partial         |
| Renderer.*                             | Partial         |
| Scale.*                                | Partial         |
| Scene                                  | Partial         |
| Scenes.*                               | Partial         |
| Sound.*                                | Partial         |
| Structs.*                              | Partial         |
| Textures.*                             | Partial         |
| Tilemaps.*                             | Partial         |
| Time.*                                 | Partial         |
| Tweens.*                               | Partial         |
| SpineContainer                         | Partial         |
