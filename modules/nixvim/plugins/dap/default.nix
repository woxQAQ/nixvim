{
  lib,
  pkgs,
  ...
}:
{
  dap-ui = {
    enable = true;
    lazyLoad.settings = {
      before.__raw = ''
        function()
          require('lz.n').trigger_load('nvim-dap', {})
          require('lz.n').trigger_load('nvim-dap-virtual-text', {})
        end
      '';
      keys = [
        {
          __unkeyed-1 = "<leader>du";
          __unkeyed-2.__raw = ''
            function()
              require('dap.ext.vscode').load_launchjs(nil, {})
              require("dapui").toggle()
            end
          '';
          desc = "Toggle Debugger UI";
        }
      ];
    };
  };
  dap = {
    enable = true;
    luaConfig.pre = # lua
      ''
        require("dap").listeners.before.attach.dapui_config = function()
          require("dapui").open()
        end
        require("dap").listeners.before.launch.dapui_config = function()
          require("dapui").open()
        end
        require("dap").listeners.before.event_terminated.dapui_config = function()
          require("dapui").close()
        end
        require("dap").listeners.before.event_exited.dapui_config = function()
          require("dapui").close()
        end

      '';
    lazyLoad.settings = {
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
    };
    signs = {
      dapBreakpoint = {
        text = "";
        texthl = "DapBreakpoint";
      };
      dapBreakpointCondition = {
        text = "";
        texthl = "DapBreakpointCondition";
      };
      dapBreakpointRejected = {
        text = "";
        texthl = "DapBreakpointRejected";
      };
      dapLogPoint = {
        text = "";
        texthl = "DapLogPoint";
      };
      dapStopped = {
        text = "";
        texthl = "DapStopped";
      };
    };
  };
  dap-go = {
    enable = true;
    settings.delve.path = "${lib.getExe pkgs.delve}";
  };
  dap-python.enable = true;
}
