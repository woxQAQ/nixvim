{ config, lib, ... }:
{
  keymaps = lib.mkIf (config.plugins.mini.enable && lib.hasAttr "map" config.plugins.mini.modules) [
    {
      mode = "n";
      key = "<leader>uM";
      action.__raw = "MiniMap.toggle";
      options = {
        desc = "MiniMap toggle";
        silent = true;
      };
    }
  ];
}
