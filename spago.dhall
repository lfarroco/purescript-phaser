{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "phaser"
, dependencies =
  [ "canvas"
  , "console"
  , "effect"
  , "maybe"
  , "nullable"
  , "options"
  , "prelude"
  , "small-ffi"
  , "web-html"
  , "unsafe-coerce"
  ]
, license = "MIT"
, repository = "https://github.com/lfarroco/purescript-phaser"
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
