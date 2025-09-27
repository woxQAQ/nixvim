{
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

  keymaps = [
    {
      key = "<leader>act";
      action = "<cmd>ClaudeCode<CR>";
      options = {
        desc = "Toggle Claude";
      };
    }
    {
      key = "<leader>acc";
      action = "<cmd>ClaudeCodeContinue<CR>";
      options = {
        desc = "Continue Claude";
      };
    }
    {
      key = "<leader>acr";
      action = "<cmd>ClaudeCodeResume<CR>";
      options = {
        desc = "Resume Claude";
      };
    }
    {
      key = "<leader>acv";
      action = "<cmd>ClaudeCodeVerbose<CR>";
      options = {
        desc = "Verbose Claude";
      };
    }
  ];
}
