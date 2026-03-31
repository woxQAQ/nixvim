# catppuccin.nvim - 柔和舒适的配色方案，
# 提供 Latte、Frappe、Macchiato、Mocha 四种主题变体，
# 并为多种插件提供统一的颜色集成
{ config, ... }:
{
  colorschemes.catppuccin = {
    lazyLoad.enable = config.plugins.lz-n.enable;
    settings = import ./setttins.nix;
  };
}
