{ config, lib, ... }:
{
  plugins.mini-starter = {
    enable = true;
    settings = import ./starter_settings.nix;
  };
}
