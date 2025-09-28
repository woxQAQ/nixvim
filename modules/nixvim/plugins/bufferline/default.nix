_: {
  # config.meta.plugins.bufferline = {
  #   description = "A snazzy 💅 buffer line (with tabpage integration) for Neovim";
  #   kind = [ "ui" ];
  # };
  plugins.bufferline = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
    settings = {
      options = import ./settings.nix;
    };
  };
  keymaps = import ./keymaps.nix;
}
