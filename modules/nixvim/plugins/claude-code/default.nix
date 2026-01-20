# { ... }:
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
  # keymaps = import ./keymaps.nix;
}
