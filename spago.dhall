{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "phaser"
, dependencies =
  [ "arrays"
  , "canvas"
  , "console"
  , "easy-ffi"
  , "effect"
  , "maybe"
  , "nullable"
  , "prelude"
  , "web-html"
  , "options"
  ]
, license = "MIT"
, repository = "https://github.com/lfarroco/purescript-phaser"
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
