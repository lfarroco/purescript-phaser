# purescript-phaser

```sh
spago install phaser
```

Bindings for common Phaser 3 operations. As Phaser has a large API, not everything is implemented.
Feel free to open a PR or ask for a new binding!

Some bindings allow a more FP-friendly way of handling operations,
like returning a scene or game object to allow function chaining.

This library is intended to be non-optioned, so that you can build your own abstractions upon
the bindings offered here.

### Installing

Make sure to include a script tag with Phaser 3 (or add it to your bundle)
before importing your PureScript code.

## Examples

You can check our example library at https://lfarroco.github.io/purescript-phaser/.

The code for the examples is available at `/docs/examples`.

### Compiling the examples

You can play with each example and compile it with `spago bundle-app`. You can also
run `make compile-examples` in the root directory to compile all examples.
