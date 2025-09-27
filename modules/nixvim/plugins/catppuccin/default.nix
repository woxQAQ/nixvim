{ config, ... }:
{
  colorschemes.catppuccin = {
    lazyLoad.enable = config.plugins.lz-n.enable;
    settings = builtins.readFile ./setttins.nix;
  };
}
