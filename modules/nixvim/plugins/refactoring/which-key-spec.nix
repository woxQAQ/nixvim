{
  config,
  lib,
  ...
}:
let
  inherit (lib) optionals;
  inherit (config.plugins) refactoring;
in
{
  plugins.which-key.settings.spec = lib.optionals config.plugins.refactoring.enable [
    {
      __unkeyed-1 = "<leader>r";
      mode = "x";
      group = "Refactor";
      icon = " ";
    }
  ];
}
