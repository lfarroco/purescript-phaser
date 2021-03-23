{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "purescript-phaser"
, dependencies = [ "aff", "console", "effect", "psci-support" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
