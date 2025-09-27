{ config, ... }:
{
  colorschemes.catppuccin = {
    lazyLoad.enable = config.plugins.lz-n.enable;
    settings = import ./setttins.nix;
  };
}
