{
  keymaps = import ./keymaps.nix;
  plugins.fastaction = {
    enable = true;
    lazyLoad.settings.lazy = true;
  };
}
