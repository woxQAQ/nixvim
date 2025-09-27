{ lib, pkgs, ... }:
{
  plugins.iron = {
    enable = true;
    lazyLoad.settings.cmd = [
      "IronRepl"
      "IronReplHere"
    ];
    settings = import ./settings.nix { inherit lib pkgs; };
  };
}
