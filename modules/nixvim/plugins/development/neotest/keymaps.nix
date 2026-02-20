[
  {
    mode = "n";
    key = "<leader>dn";
    action.__raw = ''
      function()
        require("neotest").run.run({strategy = "dap"})
      end
    '';
    options = {
      desc = "Neotest Debug";
    };
  }
  {
    mode = "n";
    key = "<leader>ta";
    action = "<CMD>Neotest attach<CR>";
    options = {
      desc = "Attach";
    };
  }
  {
    mode = "n";
    key = "<leader>td";
    action.__raw = ''
      function()
        require("neotest").run.run({strategy = "dap"})
      end
    '';
    options = {
      desc = "Debug";
    };
  }
  {
    mode = "n";
    key = "<leader>th";
    action = "<CMD>Neotest output<CR>";
    options = {
      desc = "Output";
    };
  }
  {
    mode = "n";
    key = "<leader>to";
    action = "<CMD>Neotest output-panel<CR>";
    options = {
      desc = "Output Panel toggle";
    };
  }
  {
    mode = "n";
    key = "<leader>tr";
    action = "<CMD>Neotest run<CR>";
    options = {
      desc = "Run (Nearest Test)";
    };
  }
  {
    mode = "n";
    key = "<leader>tR";
    action.__raw = ''
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end
    '';
    options = {
      desc = "Run (File)";
    };
  }
  {
    mode = "n";
    key = "<leader>ts";
    action = "<CMD>Neotest stop<CR>";
    options = {
      desc = "Stop";
    };
  }
  {
    mode = "n";
    key = "<leader>tt";
    action = "<CMD>Neotest summary<CR>";
    options = {
      desc = "Summary toggle";
    };
  }
]
