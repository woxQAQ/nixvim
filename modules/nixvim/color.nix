{
  programs.nixvim = {
    colorschemes = {
      catppuccin = {
        enable = true;
        settings = {
          default_integrations = true;
          flavour = "macchiato";
          integrations = {
            # cmp = true;
            gitsigns = true;
            indent_blankline = {
              enable = true;
              colored_indent_levels = true;
            };
            neotree = true;
            treesitter = true;
          };
        };
      };
    };
    plugins = {
      transparent.enable = true;
    };
  };
}
