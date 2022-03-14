{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "phaser"
, dependencies =
  [ "aff"
  , "arrays"
  , "canvas"
  , "console"
  , "easy-ffi"
  , "effect"
  , "maybe"
  , "nullable"
  , "option"
  , "prelude"
  , "psci-support"
  , "unsafe-coerce"
  , "web-html"
  ]
, license = "MIT"
, repository = "https://github.com/lfarroco/purescript-phaser"
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
