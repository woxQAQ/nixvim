# flash.nvim - 快速跳转插件，支持跳转到任意位置 (类似 vim-easymotion)，
# 同时提供 t/T/f/F 增强跳转、树节点选择和远程操作
{
  plugins.flash = {
    enable = true;

    lazyLoad.settings.event = "DeferredUIEnter";

    settings = import ./settings.nix;
  };

  keymaps = import ./keymaps.nix;
}
