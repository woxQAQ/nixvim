# codesnap.nvim - 代码截图插件，
# 将当前代码生成美观的截图图片，
# 支持自定义字体、行号、水印、Mac 窗口样式等，
# 可复制到剪贴板或保存到文件
{ pkgs, ... }:
{
  plugins.codesnap = {
    enable = true;
    package = pkgs.vimPlugins.codesnap-nvim;
    lazyLoad.settings.cmd = [
      "CodeSnap"
      "CodeSnapSave"
      "CodeSnapHighlight"
      "CodeSnapSaveHighlight"
    ];
    settings = {
      snapshot_config = {
        code_config = {
          font_family = "Maple Mono NF CN";
          breadcrumbs = {
            enable = true;
            separator = "/";
          };
        };
        show_line_number = false;
        snapshot_config = {
          window = {
            mac_window_bar = true;
          };
        };
        watermark.content = "";
      };
    };
  };
  keymaps = import ./keymaps.nix;
}
