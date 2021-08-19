{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "purescript-phaser"
, dependencies = [
    "prelude",
    "aff",
    "effect",
    "functions",
]
, license = "MIT"
, repository = "https://github.com/lfarroco/purescript-phaser"
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
