{
  plugins.noice = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
  };
  plugins.notify = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
    settings.background_colour = "#000000";
  };
  keymaps = import ./keymaps.nix;
}
