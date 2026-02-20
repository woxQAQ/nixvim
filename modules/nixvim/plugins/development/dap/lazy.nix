{
  keys = [
    {
      __unkeyed-1 = "<leader>db";
      __unkeyed-2.__raw = ''
        function() require('dap').toggle_breakpoint() end
      '';
      desc = "Breakpoint toggle";
    }
    {
      __unkeyed-1 = "<leader>dc";
      __unkeyed-2.__raw = ''
        function() require('dap').continue() end
      '';
      desc = "Continue Debugging (Start)";
    }
    {
      __unkeyed-1 = "<leader>dC";
      __unkeyed-2.__raw = ''
        function() require('dap').run_to_cursor() end
      '';
      desc = "Run to cursor";
    }
    {
      __unkeyed-1 = "<leader>dg";
      __unkeyed-2.__raw = ''
        function() require('dap').goto_() end
      '';
      desc = "Go to line (no execute)";
    }
    {
      __unkeyed-1 = "<leader>di";
      __unkeyed-2.__raw = ''
        function() require('dap').step_into() end
      '';
      desc = "Step Into";
    }
    {
      __unkeyed-1 = "<leader>dj";
      __unkeyed-2.__raw = ''
        function() require('dap').down() end
      '';
      desc = "Down";
    }
    {
      __unkeyed-1 = "<leader>dk";
      __unkeyed-2.__raw = ''
        function() require('dap').up() end
      '';
      desc = "Up";
    }
    {
      __unkeyed-1 = "<leader>dl";
      __unkeyed-2.__raw = ''
        function() require('dap').run_last() end
      '';
      desc = "Run Last";
    }
    {
      __unkeyed-1 = "<leader>do";
      __unkeyed-2.__raw = ''
        function() require('dap').step_out() end
      '';
      desc = "Step Out";
    }
    {
      __unkeyed-1 = "<leader>dO";
      __unkeyed-2.__raw = ''
        function() require('dap').step_over() end
      '';
      desc = "Step Over";
    }
    {
      __unkeyed-1 = "<leader>dp";
      __unkeyed-2.__raw = ''
        function() require('dap').pause() end
      '';
      desc = "Pause";
    }
    {
      __unkeyed-1 = "<leader>dr";
      __unkeyed-2.__raw = ''
        function() require('dap').repl.toggle() end
      '';
      desc = "Toggle REPL";
    }
    {
      __unkeyed-1 = "<leader>ds";
      __unkeyed-2.__raw = ''
        function() require('dap').session() end
      '';
      desc = "Session";
    }
    {
      __unkeyed-1 = "<leader>dt";
      __unkeyed-2.__raw = ''
        function() require('dap').terminate() end
      '';
      desc = "Terminate Debugging";
    }
  ];
}
