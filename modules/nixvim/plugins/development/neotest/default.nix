{
  config,
  lib,
  ...
}:
{
  plugins.neotest = {
    enable = true;
    adapters = lib.mkIf (config.plugins.treesitter.enable && config.plugins.neotest.enable) {
      bash.enable = true;
      go.enable = true;
      python.enable = true;
    };
    lazyLoad.settings.keys = [
      {
        __unkeyed-1 = "<leader>tt";
        __unkeyed-3 = "<CMD>Neotest summary<CR>";
        desc = "Summary toggle";
      }
      {
        __unkeyed-1 = "<leader>dn";
        __unkeyed-3.__raw = ''
          function()
            require("neotest").run.run({strategy = "dap"})
          end
        '';
        desc = "Neotest Debug";
      }
      {
        __unkeyed-1 = "<leader>ta";
        __unkeyed-3 = "<CMD>Neotest attach<CR>";
        desc = "Attach";
      }
      {
        __unkeyed-1 = "<leader>td";
        __unkeyed-3.__raw = ''
          function()
            require("neotest").run.run({strategy = "dap"})
          end
        '';
        desc = "Debug";
      }
      {
        __unkeyed-1 = "<leader>th";
        __unkeyed-3 = "<CMD>Neotest output<CR>";
        desc = "Output";
      }
      {
        __unkeyed-1 = "<leader>to";
        __unkeyed-3 = "<CMD>Neotest output-panel<CR>";
        desc = "Output Panel toggle";
      }
      {
        __unkeyed-1 = "<leader>tr";
        __unkeyed-3 = "<CMD>Neotest run<CR>";
        desc = "Run (Nearest Test)";
      }
      {
        __unkeyed-1 = "<leader>tR";
        __unkeyed-3.__raw = ''
          function()
            require("neotest").run.run(vim.fn.expand("%"))
          end
        '';
        desc = "Run (File)";
      }
      {
        __unkeyed-1 = "<leader>ts";
        __unkeyed-3 = "<CMD>Neotest stop<CR>";
        desc = "Stop";
      }
    ];
  };
  keymaps = lib.mkIf (
    config.plugins.neotest.enable && !config.plugins.lz-n.enable
  ) (import ./keymaps.nix);
}
