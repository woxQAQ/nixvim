{ ... }:

{
  plugins.bufferline = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
    settings = import ./settings.nix;
  };
  keymaps = import ./keymaps.nix;
}
