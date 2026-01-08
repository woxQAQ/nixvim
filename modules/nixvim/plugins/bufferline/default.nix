_: {
  # config.meta.plugins.bufferline = {
  #   description = "A snazzy 💅 buffer line (with tabpage integration) for Neovim";
  #   kind = [ "ui" ];
  # };
  plugins.bufferline = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
    settings.options = rec {
      diagnostics = "nvim_lsp";
      # buffer_close_icon = "󰅙";

      modified_icon = "●";
      buffer_close_icon = "";
      left_trunc_marker = "";
      right_trunc_marker = "";
      max_name_length = 18;
      max_prefix_length = 15;
      tab_size = 10;
      close_icon = buffer_close_icon;

      enforce_regular_tabs = false;
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
      always_show_bufferline = true;
      hover = {
        enabled = true;
        delay = 200;
        reveal = [ "close" ];
      };
    };
  };
  keymaps = import ./keymaps.nix;
}
