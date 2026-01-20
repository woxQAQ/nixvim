{ lib, config }:
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

  keymaps = lib.mkIf config.plugins.claude-code.enable import ./keymaps.nix;
}
