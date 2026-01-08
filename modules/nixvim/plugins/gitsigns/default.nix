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
