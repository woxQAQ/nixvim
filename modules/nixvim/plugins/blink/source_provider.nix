{
  lib,
  config,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf elem;
  inherit (config.plugins)
    blink-cmp-git
    blink-emoji
    blink-copilot
    blink-cmp-dictionary
    blink-ripgrep
    blink-cmp-spell
    ;
  inherit (pkgs.vimPlugins) blink-cmp-npm-nvim blink-nerdfont-nvim blink-cmp-conventional-commits;
in
{
  lsp.score_offset = 4;
  copilot = mkIf blink-copilot.enable {
    name = "copilot";
    module = "blink-copilot";
    async = true;
    score_offset = 100;
  };
  conventional_commits = mkIf (elem blink-cmp-conventional-commits config.extraPlugins) {
    name = "Conventional Commits";
    module = "blink-cmp-conventional-commits";
    enabled.__raw = ''
      function()
        return vim.bo.filetype == 'gitcommit'
      end
    '';
  };
  dictionary = mkIf blink-cmp-dictionary.enable {
    name = "Dict";
    module = "blink-cmp-dictionary";
    min_keyword_length = 3;
  };
  emoji = mkIf blink-emoji.enable {
    name = "Emoji";
    module = "blink-emoji";
    score_offset = 1;
  };
  git = mkIf blink-cmp-git.enable {
    name = "Git";
    module = "blink-cmp-git";
    enabled = true;
    score_offset = 100;
    should_show_items.__raw = ''
      function()
          return vim.o.filetype == 'gitcommit' or vim.o.filetype == 'markdown'
      end
    '';
  };
  ripgrep = mkIf blink-ripgrep.enable {
    name = "Ripgrep";
    module = "blink-ripgrep";
    async = true;
    score_offset = 1;
  };
  spell = mkIf blink-cmp-spell.enable {
    name = "Spell";
    module = "blink-cmp-spell";
    score_offset = 1;
  };
  nerdfont = mkIf (elem blink-nerdfont-nvim config.extraPlugins) {
    module = "blink-nerdfont";
    name = "Nerd Fonts";
    score_offset = 15;
    opts = {
      insert = true;
    };
  };
  npm = mkIf (elem blink-cmp-npm-nvim config.extraPlugins) {
    name = "npm";
    module = "blink-cmp-npm";
    async = true;
    enabled.__raw = ''
      function()
          return vim.fn.expand('%:t') == 'package.json'
      end
    '';
    opts = {
      ignore = { };
      only_semantic_versions = true;
      only_latest_version = false;
    };
  };
}
