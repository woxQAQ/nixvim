# gitsigns.nvim - Git 集成插件，在行号旁显示增删改标记，
# 支持行内 blame 注释、代码块暂存/重置、差异预览，
# 以及 hunk 导航和部分暂存等 Git 操作
{
  plugins.gitsigns = {
    enable = true;

    lazyLoad.settings.event = [
      "BufReadPost"
      "BufNewFile"
    ];
    settings = {
      current_line_blame = true;
      # current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>";
      update_debounce = 200;

      current_line_blame_opts = {
        delay = 500;

        ignore_blank_lines = true;
        ignore_whitespace = true;
        virt_text = true;
        virt_text_pos = "eol";
      };

      signcolumn = true;
    };
  };
  keymaps = import ./keymaps.nix;
}
