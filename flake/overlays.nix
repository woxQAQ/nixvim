{ lib, inputs, ... }:
let
  # Read the overlays directory and pick `.nix` files deterministically.
  allFiles = builtins.attrNames (builtins.readDir ../overlays);
  files = lib.filter (name: lib.hasSuffix ".nix" name) allFiles;
in
{
  flake.overlays = lib.listToAttrs (
    map (filename: {
      name = lib.removeSuffix ".nix" filename;
      value = import (../overlays + "/${filename}") {
        flake = inputs.self;
      };
    }) files
  );
}
