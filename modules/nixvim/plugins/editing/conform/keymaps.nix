[
  {
    action.__raw = ''
      function(args)
        vim.cmd({cmd="Conform",args=args})
      end
    '';
    mode = "v";
    key = "<leader>lf";
    options = {
      silent = true;
      desc = "Format selection";
    };
  }
  {
    action.__raw = ''
      function()
        vim.cmd({cmd="Conform"})
      end
    '';
    key = "<leader>lf";
    options = {
      silent = true;
      desc = "Format buffer";
    };
  }
]
