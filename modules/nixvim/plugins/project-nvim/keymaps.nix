{ config, lib, ... }:
let
  inherit (config.plugins)
    telescope
    project-nvim
    lz-n
    snacks
    ;
in
{
  keymaps =
    lib.mkIf
      (
        telescope.enable
        && project-nvim.enable
        && !lz-n.enable
        && (!snacks.enable || (snacks.enable && !lib.hasAttr "picker" snacks.settings))
      )
      [
        {
          mode = "n";
          options.silent = true;
          key = "<leader>fp";
          action = ":Telescope projects<CR>";
        }
      ];
}
