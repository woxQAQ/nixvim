{ lib, config, ... }:
{
  imports = [ ./keymaps.nix ];
  plugins.toggleterm = {
    enable = true;
    lazyLoad.settings = {
      cmd = "ToggleTerm";
      keys = [
        "<leader>gg"
      ];
    };

    settings = {
      direction = "float";
    };
  };
}
