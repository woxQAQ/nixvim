{ config, lib, ... }:
{
  imports = [ ./keymaps.nix ];
  plugins.gitignore.enable = true;
}
