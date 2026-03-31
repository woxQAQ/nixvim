# nvim-colorizer.lua - 在编辑器中实时预览颜色代码，
# 将 #RRGGBB、rgb()、hsl() 等颜色表示显示为实际背景色，
# 支持 CSS 颜色名、Tailwind CSS 类名等
{
  plugins.colorizer = {
    enable = true;

    lazyLoad.settings.cmd = "ColorizerToggle";
  };

  keymaps = import ./keymaps.nix;
}
