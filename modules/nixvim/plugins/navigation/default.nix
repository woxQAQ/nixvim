{ lib, ... }:
let
  inherit (builtins) readDir;
  plugins = lib.pipe (readDir ./.) [
    (lib.filterAttrs (_name: type: type == "directory"))
    lib.attrNames
    (map (name: ./. + "/${name}"))
  ];
in
{
  imports = plugins;
}
