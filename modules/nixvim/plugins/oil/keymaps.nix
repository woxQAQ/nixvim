{ config, lib, ... }:
{
  keymaps = lib.mkIf config.plugins.oil.enable [
    {
      mode = "n";
      key = "<leader>fb";
      action = ":Oil<CR>";
      options.desc = "Open Oil File Browser";
    }
  ];
}
