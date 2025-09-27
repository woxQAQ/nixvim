{
  plugins = {
    fastaction = {
      enable = true;
      lazyLoad.settings.lazy = true;
    };
  };

  keymaps =  [
    {
      mode = "n";
      key = "<leader>lc";
      action = ''<cmd>lua require('fastaction').code_action()<cr>'';
      options = {
        desc = "Fastaction code action";
      };
    }
    {
      mode = "v";
      key = "<leader>lc";
      action = ''<cmd>lua require('fastaction').range_code_action()<cr>'';
      options = {
        desc = "Fastaction code action";
      };
    }
  ];
}
