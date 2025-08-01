{ ... }:
{
  imports = [
    ./which-key-specs.nix
    ./keymaps.nix
  ];
  plugins.gitsigns = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
    settings = {
      current_line_blame = true;
      current_line_blame_opts = {
        delay = 500;
        ignore_blank_lines = true;
        ignore_witespace = true;
        virt_text = true;
        virt_text_pos = "eol";
      };
      signcolumn = false;
      trouble = true;
    };
  };
}
