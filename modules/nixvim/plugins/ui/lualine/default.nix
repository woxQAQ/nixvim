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
        disabledFiletypes = {
          statusline = [
            "startup"
            "alpha"
          ];
        };

        theme = "catppuccin";
        globalstatus = true;
      };
      sections = import ./sections.nix;
    };
  };
}
