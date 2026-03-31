# toggleterm.nvim - 可持久化的浮动/水平/垂直终端，
# 在 Neovim 中快速切换终端窗口，支持多个终端实例、
# 终端中的浮动窗口以及终端间的导航
{
  plugins.toggleterm = {
    enable = false;

    lazyLoad = {
      settings = {
        cmd = "ToggleTerm";
      };
    };

    settings = {
      direction = "float";
    };
  };
}
