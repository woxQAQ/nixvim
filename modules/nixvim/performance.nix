{
    performance = {
      combinePlugins = {
        enable = true;
        standalonePlugins = [
          "hmts.nvim"
          "neorg"
          "nvim-treesitter"
          "blink.cmp"
          "oil.nvim"
        ];
      };
      byteCompileLua = {
        enable = true;
        configs = true;
        luaLib = true;
        nvimRuntime = true;
        plugins = true;
      };
    };


}
