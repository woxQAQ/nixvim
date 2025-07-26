[
  # hunk specified keys
  {
    mode = "n";
    key = "<leader>ghP";
    action = ":Gitsigns preview_hunk<CR>";
    options.desc = "Preview hunk";
  }
  {
    mode = [
      "n"
      "v"
    ];
    key = "<leader>ghs";
    action = ":Gitsigns stage_hunk<CR>";
    options.desc = "Stage Hunk";
  }
  {
    mode = [
      "n"
      "v"
    ];
    key = "<leader>ghu";
    action = ":Gitsigns undo_stage_hunk<CR>";
    options.desc = "Undo Stage Hunk";
  }
  {
    mode = [
      "n"
      "v"
    ];
    key = "<leader>ghr";
    action = ":Gitsigns reset_hunk<CR>";
    options.desc = "Reset Hunk";
  }
  {
    mode = "n";
    key = "<leader>ghp";
    action.__raw = # lua
      ''
        function()
          if vim.wo.diff then
            return ${builtins.toJSON "<leader>gp"}
          end
          vim.schedule(function()
            require("gitsigns").prev_hunk()
          end)
        end
      '';
    options = {
      silent = true;
      desc = "Previous hunk";
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
          vim.schedule(function()
            require("gitsigns").next_hunk()
          end)
        end
      '';
    options = {
      silent = true;
      desc = "Next hunk";
    };
  }
]
