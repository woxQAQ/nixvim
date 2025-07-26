{ ... }:
{
  imports = [ ./keymaps.nix ];
  plugins.precognition = {
    enable = true;

    lazyLoad.settings.cmd = "Precognition";

    settings = {
      startVisible = false;
    };
  };
}
