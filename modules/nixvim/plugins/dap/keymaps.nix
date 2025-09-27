[
  {
    mode = "n";
    key = "<leader>db";
    # action = "<CMD>DapToggleBreakpoint<CR>";
    action = "<CMD>lua require('dap').toggle_breakpoint()<CR>";
    options = {
      desc = "Breakpoint toggle";
    };
  }
  {
    mode = "n";
    key = "<leader>dc";
    # action = "<CMD>DapContinue<CR>";
    action = "<CMD>lua require('dap').continue()<CR>";
    options = {
      desc = "Continue Debugging (Start)";
    };
  }
  {
    mode = "n";
    key = "<leader>dC";
    action = "<CMD>lua require('dap').run_to_cursor()<CR>";
    options = {
      desc = "Run to cursor";
    };
  }
  {
    mode = "n";
    key = "<leader>dg";
    action = "<CMD>lua require('dap').goto_()<CR>";
    options = {
      desc = "Go to line (no execute)";
    };
  }
  {
    mode = "n";
    key = "<leader>di";
    # action = "<CMD>DapStepInto<CR>";
    action = "<CMD>lua require('dap').step_into()<CR>";
    options = {
      desc = "Step Into";
    };
  }
  {
    mode = "n";
    key = "<leader>dj";
    action = "<CMD>lua require('dap').down()<CR>";
    options = {
      desc = "Down";
    };
  }
  {
    mode = "n";
    key = "<leader>dk";
    action = "<CMD>lua require('dap').up()<CR>";
    options = {
      desc = "Up";
    };
  }
  {
    mode = "n";
    key = "<leader>dl";
    action = "<CMD>lua require('dap').run_last()<CR>";
    options = {
      desc = "Run Last";
    };
  }
  {
    mode = "n";
    key = "<leader>do";
    # action = "<CMD>DapStepOut<CR>";
    action = "<CMD>lua require('dap').step_out()<CR>";
    options = {
      desc = "Step Out";
    };
  }
  {
    mode = "n";
    key = "<leader>dO";
    # action = "<CMD>DapStepOver<CR>";
    action = "<CMD>lua require('dap').step_over()<CR>";
    options = {
      desc = "Step Over";
    };
  }
  {
    mode = "n";
    key = "<leader>dp";
    action = "<CMD>lua require('dap').pause()<CR>";
    options = {
      desc = "Pause";
    };
  }
  {
    mode = "n";
    key = "<leader>dr";
    # action = "<CMD>DapToggleRepl<CR>";
    action = "<CMD>lua require('dap').repl.toggle()<CR>";
    options = {
      desc = "Toggle REPL";
    };
  }
  {
    mode = "n";
    key = "<leader>ds";
    action = "<CMD>lua require('dap').session()<CR>";
    options = {
      desc = "Session";
    };
  }
  {
    mode = "n";
    key = "<leader>dt";
    # action = "<CMD>DapTerminate<CR>";
    action = "<CMD>lua require('dap').terminate()<CR>";
    options = {
      desc = "Terminate Debugging";
    };
  }
]
