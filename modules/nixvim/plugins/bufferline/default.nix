{ config, lib, ... }:

{
  plugins.bufferline = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
    settings = builtins.readFile ./settings.nix;
  };
  keymaps = builtins.readFile ./keymaps.nix;
}
