{ lib, config, ... }:
{
  which-key.settings.spec = lib.optionals config.plugins.trouble.enable [
    {
      __unkeyed-1 = "<leader>x";
      mode = "n";
      icon = "";
      group = "Trouble";
    }
  ];
}
