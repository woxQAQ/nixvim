{
  plugins.claude-code = {
    enable = true;
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

  keymaps = import ./keymaps.nix;
}
