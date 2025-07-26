[
  # blame specified keys
  {
    mode = "n";
    key = "<leader>ugB";
    action = ":Gitsigns blame<CR>";
    options = {
      desc = "Git Blame Sidebar";
    };
  }
  {
    mode = "n";
    key = "<leader>ugb";
    action = ":Gitsigns toggle_current_line_blame<CR>";
    options = {
      desc = "Git Blame line toggle";
    };
  }
  {
    mode = "n";
    key = "<leader>gb";
    action.__raw = # lua
      ''
        function()
          require("gitsigns").blame_line{full=true}
        end
      '';
    options = {
      silent = true;
      desc = "Git Blame toggle";
    };
  }
]
