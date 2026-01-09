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
      settings = {
        max_lines = 4;
        min_window_height = 40;
        multiwindow = true;
        separator = "-";
      };
    };

    # treesitter-refactor is deprecated and incompatible with modern nvim-treesitter
    # treesitter-refactor = {
    #   inherit (config.plugins.treesitter) enable;
    #   settings = {
    #     highlightDefinitions = {
    #       enable = true;
    #       clearOnCursorMove = true;
    #     };
    #     smartRename = {
    #       enable = true;
    #       keymaps = {
    #         smartRename = "gR";
    #       };
    #     };
    #     navigation = {
    #       enable = true;
    #     };
    #   };
    #
    # };
  };

  keymaps = import ./keymaps.nix;
}
