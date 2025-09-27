_:

{
  plugins.bufferline = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
    settings = {
      options = import ./settings.nix;
    };
  };
  keymaps = import ./keymaps.nix;
}
