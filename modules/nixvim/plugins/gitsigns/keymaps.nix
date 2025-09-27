[
  # UI binds
  {
    mode = "n";
    key = "<leader>ugb";
    action = "<cmd>Gitsigns toggle_current_line_blame<CR>";
    options = {
      desc = "Git Blame line toggle";
    };
  }
  {
    mode = "n";
    key = "<leader>ugB";
    action = "<cmd>Gitsigns blame<CR>";
    options = {
      desc = "Git Blame sidebar";
    };
  }
  {
    mode = "n";
    key = "<leader>ugd";
    action = "<cmd>Gitsigns toggle_deleted<CR>";
    options = {
      desc = "Deleted toggle";
    };
  }
  {
    mode = "n";
    key = "<leader>ugl";
    action = "<cmd>Gitsigns toggle_linehl<CR>";
    options = {
      desc = "Line Highlight toggle";
    };
  }
  {
    mode = "n";
    key = "<leader>ugh";
    action = "<cmd>Gitsigns toggle_numhl<CR>";
    options = {
      desc = "Number Highlight toggle";
    };
  }
  {
    mode = "n";
    key = "<leader>ugw";
    action = "<cmd>Gitsigns toggle_word_diff<CR>";
    options = {
      desc = "Word Diff toggle";
    };
  }
  {
    mode = "n";
    key = "<leader>ugs";
    action = "<cmd>Gitsigns toggle_signs<CR>";
    options = {
      desc = "Signs toggle";
    };
  }
  {
    mode = "n";
    key = "<leader>gb";
    action.__raw = ''
      function() require("gitsigns").blame_line{full=true} end
    '';
    options = {
      desc = "Git Blame toggle";
      silent = true;
    };
  }
  # Hunk binds
  {
    mode = "n";
    key = "<leader>ghp";
    action.__raw = # lua
      ''
        function()
          if vim.wo.diff then return ${builtins.toJSON "<leader>gp"} end

          vim.schedule(function() require("gitsigns").prev_hunk() end)

          return '<Ignore>'
        end
      '';
    options = {
      desc = "Previous hunk";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<leader>ghn";
    action.__raw = # lua
      ''
        function()
          if vim.wo.diff then
            return ${builtins.toJSON "<leader>gn"}
          end

          vim.schedule(function() require("gitsigns").next_hunk() end)

          return '<Ignore>'
        end
      '';
    options = {
      desc = "Next hunk";
      silent = true;
    };
  }
  {
    mode = [
      "n"
      "v"
    ];
    key = "<leader>ghs";
    action = "<cmd>Gitsigns stage_hunk<CR>";
    options = {
      desc = "Stage hunk";
    };
  }
  {
    mode = "n";
    key = "<leader>ghu";
    action = "<cmd>Gitsigns undo_stage_hunk<CR>";
    options = {
      desc = "Undo stage hunk";
    };
  }
  {
    mode = [
      "n"
      "v"
    ];
    key = "<leader>ghr";
    action = "<cmd>Gitsigns reset_hunk<CR>";
    options = {
      desc = "Reset hunk";
    };
  }
  {
    mode = "n";
    key = "<leader>ghP";
    action = "<cmd>Gitsigns preview_hunk<CR>";
    options = {
      desc = "Preview hunk";
    };
  }
  {
    mode = "n";
    key = "<leader>gh<C-p>";
    action = "<cmd>Gitsigns preview_hunk_inline<CR>";
    options = {
      desc = "Preview hunk inline";
    };
  }
  # Buffer binds
  {
    mode = "n";
    key = "<leader>gS";
    action = "<cmd>Gitsigns stage_buffer<CR>";
    options = {
      desc = "Stage buffer";
    };
  }
  {
    mode = "n";
    key = "<leader>gR";
    action = "<cmd>Gitsigns reset_buffer<CR>";
    options = {
      desc = "Reset buffer";
    };
  }
]
