{
  plugins.trouble = {
    enable = true;

    lazyLoad.settings.cmd = [ "Trouble" ];
    settings = import ./settings.nix;
  };
  keymaps = import ./keymaps.nix;
}
