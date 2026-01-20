{ lib, config, ... }:
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

  config = lib.mkIf config.plugins.claude-code.enable {
    keymaps = import ./keymaps.nix;
  };
}
