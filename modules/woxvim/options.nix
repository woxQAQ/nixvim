{ lib, ... }:
{
  options.woxVim = {
    colortheme = lib.mkOption {
      type = lib.types.enum [
        "catppuccin"
      ];
      default = "catppuccin";
      description = "colortheme to use";
    };
  };
}
