{ lib, config, ... }:
let
  inherit (config.plugins) snacks telescope lz-n;
  inherit (lib) hasAttr mkIf;

in
{
  imports = [ ./keymaps.nix ];
  plugins.project-nvim = {
    enable = !snacks.enable || (snacks.enable && hasAttr "picker" snacks.settings);
    enableTelescope = telescope.enable;
    lazyLoad.settings = mkIf telescope.enable {
      before.__raw =
        mkIf lz-n.enable # lua
          ''
            require('lz-n').trigger_load('telescope')
          '';
      keys = mkIf (!snacks.enable || (snacks.enable && hasAttr "picker" snacks.settings)) [
        {
          __unkeyed-1 = "<leader>fp";
          __unkeyed-2 = "<cmd>Telescope projects<CR>";
          desc = "find projects";
        }
      ];
    };
  };
}
