# smartcolumn.nvim - 智能颜色列 (colorcolumn) 管理，
# 仅在光标超过指定列数时才显示参考线，
# 比固定 colorcolumn 更智能，可按文件类型配置列宽
{
  plugins.smartcolumn = {
    enable = true;

    lazyLoad.settings.event = [
      "BufReadPost"
      "BufNewFile"
    ];

    settings = {
      colorcolumn = "80";
      disabled_filetypes = [
        "dashboard"
        "snacks_dashboard"
        "ministarter"
        "checkhealth"
        "help"
        "lspinfo"
        "markdown"
        "neo-tree"
        "noice"
        "text"
      ];
      scope = "file";
    };
  };
}
