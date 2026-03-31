# fastaction.nvim - 快速代码操作 (Code Action) 选择器，
# 使用类似 Codeium/Windsurf 的浮动菜单快速选择 LSP 代码操作，
# 替代原生的 code action 弹窗，提升操作效率
{
  plugins.fastaction = {
    enable = true;
    lazyLoad.settings.lazy = true;
  };

  keymaps = import ./keymaps.nix;
}
