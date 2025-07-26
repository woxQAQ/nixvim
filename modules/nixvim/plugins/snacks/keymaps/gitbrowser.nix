{ config, lib, ... }:
let
  inherit (config.plugins) snacks;
in
{
  keymaps =
    lib.mkIf
      (snacks.enable && lib.hasAttr "gitbrowse" snacks.settings && snacks.settings.gitbrowse.enabled)
      [
        {
          mode = "n";
          key = "<leader>go";
          action = "<cmd>lua Snacks.gitbrowse()<CR>";
          options = {
            desc = "Open file in browser";
          };
        }
      ];
}
