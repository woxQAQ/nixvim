{ lib, ... }:
{
  options.woxVim = {
    colortheme = lib.mkOption {
      type = lib.types.enum [
        "catppuccin"
      ];
      default = "catppuccin";
      description = "colortheme to use";
    };
    treesitter = {
      includedGrammars = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [
          "tree-sitter-angular"
          "tree-sitter-bash"
          "tree-sitter-c"
          "tree-sitter-css"
          "tree-sitter-diff"
          "tree-sitter-dockerfile"
          "tree-sitter-git_config"
          "tree-sitter-git_rebase"
          "tree-sitter-gitattributes"
          "tree-sitter-gitcommit"
          "tree-sitter-gitignore"
          "tree-sitter-go"
          "tree-sitter-gomod"
          "tree-sitter-gosum"
          "tree-sitter-helm"
          "tree-sitter-html"
          "tree-sitter-http"
          "tree-sitter-ini"
          "tree-sitter-java"
          "tree-sitter-javascript"
          "tree-sitter-json"
          "tree-sitter-just"
          "tree-sitter-kdl"
          "tree-sitter-lua"
          "tree-sitter-make"
          "tree-sitter-markdown"
          "tree-sitter-markdown_inline"
          "tree-sitter-mermaid"
          "tree-sitter-nginx"
          "tree-sitter-nix"
          "tree-sitter-php"
          "tree-sitter-python"
          "tree-sitter-query"
          "tree-sitter-regex"
          "tree-sitter-rust"
          "tree-sitter-scss"
          "tree-sitter-terraform"
          "tree-sitter-toml"
          "tree-sitter-tsx"
          "tree-sitter-typescript"
          "tree-sitter-vim"
          "tree-sitter-vimdoc"
          "tree-sitter-xml"
          "tree-sitter-yaml"
        ];
        description = "List of treesitter grammars to explicitly include when whitelistMode is enabled.";
      };
    };
  };
}
