{
  plugins.noice = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
  };
  plugins.notify = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
  };
  keymaps = import ./keymaps.nix;
}
