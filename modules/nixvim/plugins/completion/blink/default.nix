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
      settings = import ./settings.nix;
      enable = true;
      lazyLoad.settings.event = [
        "InsertEnter"
        "CmdlineEnter"
      ];
    };
    blink-cmp-dictionary = mkBlinkPlugin { };
    blink-cmp-git = mkBlinkPlugin { };
    blink-emoji = mkBlinkPlugin { };
    blink-ripgrep = mkBlinkPlugin { };
  };
}
