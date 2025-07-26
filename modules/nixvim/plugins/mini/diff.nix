{ lib, config, ... }:
{
  imports = [ ./keymaps/diff.nix ];
  plugins.mini.modules = lib.mkIf (!config.plugins.unified.enable) {
    diff.view.style = "sign";
  };
}
