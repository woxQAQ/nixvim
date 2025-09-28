{
  # config.meta.plugins.blink = {
  #   description = "claude-code is a claude-code neovim wrapper to use claude code in neovim as a tab";
  #   kind = [
  #     "coding"
  #     "ai"
  #   ];
  # };

  plugins = {
    claude-code = {
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
  };

  keymaps = import ./keymaps.nix;
}
