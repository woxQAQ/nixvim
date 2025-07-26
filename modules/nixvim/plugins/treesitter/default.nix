{
  config,
  lib,
  self,
  system,
  ...
}@args:
let
  inherit (config.plugins) treesitter;
in
{
  imports = [
    ./keymaps.nix
  ];
  plugins.treesitter = {
    enable = true;
    nixvimInjections = true;
    grammarPackages = config.plugins.treesitter.package.passthru.allGrammars ++ [
      self.packages.${system}.tree-sitter-norg-meta
    ];
    folding = true;
    settings = {
      highlight = {
        enable = true;
        additional_vim_regex_highlighting = true;
        disable = # lua
          ''
            function(lang,bufnr)
              return vim.api.nvim_buf_line_count(bufnr) > 10000
            end
          '';
      };
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "gnn";
          node_incremental = "grn";
          scope_incremental = "grc";
          node_decremental = "grm";
        };
      };
      indent.enable = true;
    };
  };

  treesitter-context = {
    inherit (treesitter) enable;
    settings = {
      max_lines = 4;
      min_window_height = 40;
      multiwindow = true;
      separator = "-";
    };
  };

  treesitter-refactor = {
    inherit (treesitter) enable;
    highlightDefinitions = {
      enable = true;
      clearOnCursorMove = true;
    };
    smartRename = {
      enable = true;
      keymaps.smartRename = "gR";
    };
    navigation.enable = true;
  };
}
