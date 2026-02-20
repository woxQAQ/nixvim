{
  plugins.colorizer = {
    enable = true;

    lazyLoad.settings.cmd = "ColorizerToggle";
  };

  keymaps = import ./keymaps.nix;
}
