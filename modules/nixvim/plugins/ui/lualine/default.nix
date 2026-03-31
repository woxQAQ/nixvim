# lualine.nvim - 可定制的状态栏和标签栏，
# 在底部显示模式、文件名、Git 状态、LSP 状态、
# 诊断信息等，支持多个组件和主题配置
{
  plugins.lualine = {
    enable = true;

    lazyLoad.settings.event = [
      "VimEnter"
      "BufReadPost"
      "BufNewFile"
    ];

    settings = {
      options = {
        icons_enabled = true;
        component_separators = {
          left = "|";
          right = "|";
        };

        section_separators = "";
        always_divide_middle = true;
        refresh.statusline = 1000;

        disabledFiletypes = {
          statusline = [
            "startup"
            "alpha"
          ];
        };

        theme = "auto";
        globalstatus = true;
      };
      sections = import ./sections.nix;
    };
  };
}
