{ ... }:
{
  imports = [
    ./keymaps.nix
  ];
  plugins.yazi = {
    enable = true;
    lazyLoad.settings.cmd = [ "Yazi" ];
  };
}
