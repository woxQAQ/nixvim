{ lib, config, ... }:
{
  plugins = {
    which-key.settings.spec = lib.optionals config.plugins.gitsigns.enable [
      {
        __unkeyed = "<leader>gh";
        group = "Hunks";
        icon = " ";
      }
      {
        __unkeyed = "<leader>ug";
        group = "GitSigns";
      }
    ];
  };
}
