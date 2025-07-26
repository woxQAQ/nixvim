{ lib, config, ... }:
{
  plugins.which-key.settings.spec = lib.optionals config.plugins.glance.enable [
    {
      __unkeyed-1 = "<leader>lg";
      group = "Glance";
      icon = "󰍉";
    }
  ];
}
