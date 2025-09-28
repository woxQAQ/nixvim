_: {
  # config.meta.plugins.bufferline = {
  #   description = "A snazzy 💅 buffer line (with tabpage integration) for Neovim";
  #   kind = [ "ui" ];
  # };
  plugins.bufferline = {
    enable = true;
    settings.options = rec {
      diagnostics = "nvim_lsp";
      buffer_close_icon = "󰅙";
      close_icon = buffer_close_icon;
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
