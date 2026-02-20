[
  {
    mode = "x";
    key = "<leader>re";
    action = "<cmd>Refactor extract<cr>";
    options = {
      desc = "Extract Function";
    };
  }
  {
    mode = "x";
    key = "<leader>rE";
    action = "<cmd>Refactor extract_to_file<cr>";
    options = {
      desc = "Extract Function to File";
    };
  }
  {
    mode = "x";
    key = "<leader>rv";
    action = "<cmd>Refactor extract_var<cr>";
    options = {
      desc = "Extract Variable";
    };
  }

  # Inline operations (normal mode)
  {
    mode = "n";
    key = "<leader>ri";
    action = "<cmd>Refactor inline_var<CR>";
    options = {
      desc = "Inline Variable";
    };
  }
  {
    mode = "n";
    key = "<leader>rI";
    action = "<cmd>Refactor inline_func<CR>";
    options = {
      desc = "Inline Function";
    };
  }

  # Block operations (normal mode)
  {
    mode = "n";
    key = "<leader>rb";
    action = "<cmd>Refactor extract_block<CR>";
    options = {
      desc = "Extract Block";
    };
  }
  {
    mode = "n";
    key = "<leader>rB";
    action = "<cmd>Refactor extract_block_to_file<CR>";
    options = {
      desc = "Extract Block to File";
    };
  }

  # Debug operations (based on documentation)
  {
    mode = [
      "n"
      "x"
    ];
    key = "<leader>rp";
    action.__raw = ''
      function()
        require('refactoring').debug.printf({below = false})
      end
    '';
    options = {
      desc = "Debug Printf";
    };
  }
  {
    mode = [
      "n"
      "x"
    ];
    key = "<leader>rP";
    action.__raw = ''
      function()
        require('refactoring').debug.print_var()
      end
    '';
    options = {
      desc = "Debug Print Variable";
    };
  }
  {
    mode = "n";
    key = "<leader>rc";
    action.__raw = ''
      function()
        require('refactoring').debug.cleanup({})
      end
    '';
    options = {
      desc = "Debug Cleanup";
    };
  }
]
