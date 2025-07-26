{ lib, config, ... }:
{
  keymaps =
    lib.mkIf
      (
        config.plugins.snacks.enable
        && lib.hasAttr "zen" config.plugins.snacks.settings
        && config.plugins.snacks.settings.zen.enabled
      )
      [
        {
          mode = "n";
          key = "<leader>uZ";
          action = "<cmd>lua Snacks.zen()<CR>";
          options = {
            desc = "Zen Toggle";
          };
        }
      ];
}
