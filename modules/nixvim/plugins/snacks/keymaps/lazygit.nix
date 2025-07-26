{ config, lib, ... }:
let
  inherit (config.plugins) snacks;
in
{
  keymaps =
    lib.mkIf
      (snacks.enable && lib.hasAttr "lazygit" snacks.settings && snacks.settings.gitbrowse.enabled)
      [
        {
          mode = "n";
          key = "<leader>gg";
          action = "<cmd>lua Snacks.lazygit()<CR>";
          options = {
            desc = "Open lazygit";
          };
        }
      ];
}
