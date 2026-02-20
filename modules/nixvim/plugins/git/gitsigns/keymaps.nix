# ╭──────────────────────────────────────────────────────────╮
# │                    toggle keybinding                     │
# ╰──────────────────────────────────────────────────────────╯
[
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
]
#          ╭──────────────────────────────────────────────────────────╮
#          │    hunk bind                                             │
#          ╰──────────────────────────────────────────────────────────╯
++ [
  {
    mode = "n";
    key = "<leader>ghs";
    action.__raw = ''
      function()
        require('gitsigns').stage_hunk()
        vim.notify('Hunk staged', vim.log.levels.INFO, { title = 'Gitsigns' })
      end
    '';
    options = {
      desc = "Stage hunk";
    };
  }
  {
    mode = "v";
    key = "<leader>ghs";
    action.__raw = ''
      function()
        require('gitsigns').stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        vim.notify('Selected lines staged', vim.log.levels.INFO, { title = 'Gitsigns' })
      end
    '';
    options = {
      desc = "Stage Hunk";
    };
  }
  {
    mode = "n";
    key = "<leader>ghu";
    action.__raw = ''
      function()
        require('gitsigns').undo_stage_hunk()
        vim.notify('Hunk unstaged', vim.log.levels.INFO, { title = 'Gitsigns' })
      end
    '';
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
    mode = [
      "n"
      "v"
    ];
    key = "<leader>ghp";
    action = "<cmd>Gitsigns preview_hunk<CR>";
    options = {
      desc = "Preview Hunk";
    };
  }
  {
    mode = "n";
    key = "<leader>ghi";
    action = "<cmd>Gitsigns preview_hunk_inline<CR>";
    options = {
      desc = "Preview hunk inline";
    };
  }
]
++ [
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

  {
    mode = "n";
    key = "<leader>ghQ";
    action = "<cmd>Gitsigns setqflist all<CR>";
    options = {
      desc = "Set Quickfix List All";
    };
  }
  {
    mode = "n";
    key = "<leader>ghq";
    action = "<cmd>Gitsigns setqflist<CR>";
    options = {
      desc = "Set Quickfix List";
    };
  }

  {
    mode = [
      "o"
      "x"
    ];
    key = "ih";
    action = "<cmd>Gitsigns select_hunk<CR>";
    options = {
      desc = "Select Hunk";
    };
  }
]
#          ╭──────────────────────────────────────────────────────────╮
#          │    buffer bind                                           │
#          ╰──────────────────────────────────────────────────────────╯
++ [
  {
    mode = "n";
    key = "<leader>gU";
    action.__raw = ''
      function()
        local file = vim.fn.expand('%')
        vim.fn.system('git restore --staged ' .. file)
        require('gitsigns').refresh()
        vim.notify('Unstaged ' .. file, vim.log.levels.INFO, { title = 'Gitsigns' })
      end
    '';
    options = {
      desc = "Unstage Buffer";
    };
  }
  {
    mode = "n";
    key = "<leader>gS";
    action.__raw = ''
      function()
        require('gitsigns').stage_buffer()
        local file = vim.fn.expand('%')
        vim.notify('Staged ' .. file, vim.log.levels.INFO, { title = 'Gitsigns' })
      end
    '';
    options = {
      desc = "Stage Buffer";
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
#          ╭──────────────────────────────────────────────────────────╮
#          │    nav bind                                              │
#          ╰──────────────────────────────────────────────────────────╯
++ [
  {
    mode = "n";
    key = "]c";
    action.__raw = ''
      function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          require('gitsigns').nav_hunk('next')
        end)
        return '<Ignore>'
      end
    '';
    options = {
      expr = true;
      desc = "Next Hunk";
    };
  }
  {
    mode = "n";
    key = "[c";
    action.__raw = ''
      function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          require('gitsigns').nav_hunk('prev')
        end)
        return '<Ignore>'
      end
    '';
    options = {
      expr = true;
      desc = "Previous Hunk";
    };
  }
]
