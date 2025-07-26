{
  plugins.avante = {
    enable = true;
    lazyLoad.settings.event = [ "DeferredUIEnter" ];
    settings.mappings = {
      ask = "<leader>aaa";
      new_ask = "<leader>aan";
      edit = "<leader>aae";
      refresh = "<leader>aar";
      focus = "<leader>aaf";
      stop = "<leader>aaS";
      toggle = {
        default = "<leader>aat";
        debug = "<leader>aad";
        hint = "<leader>aah";
        suggestion = "<leader>aas";
        repomap = "<leader>aaR";
      };
      files = {
        add_current = "<leader>aa.";
        add_all_buffers = "<leader>aaB";
      };
      select_model = "<leader>aa?";
      select_history = "<leader>aah";
    };
  };
}
