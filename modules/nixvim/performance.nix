{ pkgs, ... }:
{
  performance = {
    combinePlugins = {
      enable = true;
      standalonePlugins = with pkgs.vimPlugins; [
        "nvim-treesitter"
        "neotest"
        overseer-nvim
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
