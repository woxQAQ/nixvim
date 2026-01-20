{ lib, config, ... }:
{
  config = lib.mkMerge [
    {
      plugins.claude-code = {
        enable = false;
        lazyLoad.settings.cmd = [
          "ClaudeCode"
          "ClaudeCodeContinue"
          "ClaudeCodeResume"
          "ClaudeCodeVerbose"
        ];

        settings = {
          window = {
            position = "vertical";
          };
        };
      };
    }
    (lib.mkIf config.plugins.claude-code.enable {
      keymaps = import ./keymaps.nix;
    })
  ];
}
