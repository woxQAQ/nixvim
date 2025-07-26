{
  config,
  lib,
  ...
}:
let
  inherit (lib) optionals;
  inherit (config.plugins) refactoring;
in
[
  {
    __unkeyed-1 = "<leader>r";
    mode = "x";
    group = "Refactor";
    icon = " ";
  }
]
