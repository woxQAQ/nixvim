[
  {
    action.__raw = ''
      function(args)
       vim.cmd({cmd = 'Conform', args = args});
      end
    '';
    mode = "v";
    key = "<leader>cf";
    options = {
      silent = true;
      buffer = false;
      desc = "Format selection";
    };
  }
  {
    action.__raw = ''
      function()
        vim.cmd('Conform');
      end
    '';
    key = "<leader>cf";
    options = {
      silent = true;
      desc = "Format buffer";
    };
  }
]
