{ pkgs, ... }:
{
  performance = {
    combinePlugins = {
      enable = true;
      standalonePlugins = with pkgs.vimPlugins; [
        "hmts.nvim"
        "blink.cmp"
        "nvim-treesitter"
        mini-nvim
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
