{
  pkgs,
  lib,
  config,
  ...
}:
let
  mkBlinkPlugin =
    {
      enable ? true,
      ...
    }@args:
    {
      inherit enable;
      lazyLoad.settings.event = [
        "InsertEnter"
        "CmdlineEnter"
      ];
    }
    // (removeAttrs args [ "enable" ]);
in
{
  plugins = {
    blink-cmp = {
      settings = import ./settings.nix {
        inherit lib pkgs config;
      };
      enable = true;
      lazyLoad.settings.event = [
        "InsertEnter"
        "CmdlineEnter"
      ];
    };
    blink-cmp-dictionary = mkBlinkPlugin { };
    blink-cmp-git = mkBlinkPlugin { };
    # blink-cmp-spell = mkBlinkPlugin { };
    blink-emoji = mkBlinkPlugin { };
    blink-ripgrep = mkBlinkPlugin { };
  };
}
