{ lib, config, ... }:
{
  keymaps = lib.mkIf config.plugins.gitignore.enable [
    {
      mode = "n";
      key = "<leader>gi";
      action.__raw = # lua
        "require('gitignore').generate";
      options = {
        desc = "Gitignore generate";
        silent = true;
      };
    }
  ];
}
