{
  config,
  lib,
  pkgs,
  ...
}:
{
  extraPlugins = lib.mkIf config.plugins.lz-n.enable [ pkgs.vimPlugins.lzn-auto-require ];
  plugins.lz-n.enable = true;
}
