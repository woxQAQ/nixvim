{
  plugins.dap-ui = {
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
  plugins.dap.luaConfig.pre = ''
    -- DEBUG LISTENERS
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
}
