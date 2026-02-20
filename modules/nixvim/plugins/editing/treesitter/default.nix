{
  config,
  ...
}:
{
  plugins = {
    treesitter = {
      enable = true;

      folding.enable = true;
      highlight.enable = true;
      indent.enable = true;
    };

    treesitter-context = {
      inherit (config.plugins.treesitter) enable;
      lazyLoad.settings.event = [
        "BufReadPost"
        "BufNewFile"
      ];
      settings = {
        max_lines = 4;
        min_window_height = 40;
        multiwindow = true;
        separator = "-";
      };
    };

  };
  keymaps = import ./keymaps.nix;
}
