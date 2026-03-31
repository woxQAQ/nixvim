# bufferline.nvim (akinsho/bufferline) - 顶部 Buffer 标签栏，
# 以美观的标签形式展示已打开的 buffer，
# 支持 buffer 关闭、切换、排序、悬停预览和图标显示
_: {
  # config.meta.plugins.bufferline = {
  #   description = "A snazzy 💅 buffer line (with tabpage integration) for Neovim";
  #   kind = [ "ui" ];
  # };
  plugins.bufferline = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
    settings.options = rec {
      number = "none";
      diagnostics = false;
      close_command = "bdelete! %d";
      indicator = {
        icon = "▎";
        style = "icon";
      };
      show_buffer_icons = false;
      show_buffer_close_icons = true;
      show_close_icon = true;
      show_tab_indicators = true;
      separator_style = "bar";
      persist_buffer_sort = true;
      enforce_regular_tabs = false;

      modified_icon = "●";
      buffer_close_icon = "";
      left_trunc_marker = "";
      right_trunc_marker = "";
      max_name_length = 18;
      max_prefix_length = 15;
      tab_size = 10;
      close_icon = buffer_close_icon;
      always_show_bufferline = true;
      sort_by = "id";

      custom_filter = # lua
        ''
          function(bufnr)
            local exclude_ft = { "qf", "fugitive", "git" }
            local cur_ft = vim.bo[bufnr].filetype
            local should_filter = vim.tbl_contains(exclude_ft, cur_ft)

            if should_filter then
              return false
            end

            return true
          end
        '';
      hover = {
        enabled = true;
        delay = 200;
        reveal = [ "close" ];
      };
    };
  };
  keymaps = import ./keymaps.nix;
}
