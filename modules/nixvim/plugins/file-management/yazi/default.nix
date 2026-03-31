# yazi.nvim - Yazi 终端文件管理器的 Neovim 集成，
# 在 Neovim 中打开 Yazi 文件浏览器，支持文件选择、重命名、
# 批量操作等，选中文件可在 Neovim 中打开
{
  plugins.yazi = {
    enable = true;

    lazyLoad = {
      settings = {
        cmd = [
          "Yazi"
        ];
      };
    };
  };
  keymaps = import ./keymaps.nix;
}
