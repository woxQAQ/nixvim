# noice.nvim - 重构 Neovim UI 的消息和弹出菜单，
# 使用 nvim-nui 和 nvim-notify 替代原生消息显示，
# 美化 cmdline、popup 和通知，提供更现代的 UI 体验
# nvim-notify 为 noice 提供漂亮的浮动通知
{
  plugins.noice = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
  };
  plugins.notify = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
    settings.background_colour = "#000000";
  };
  keymaps = import ./keymaps.nix;
}
