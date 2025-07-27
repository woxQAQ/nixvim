{ config, lib, ... }:
let
  inherit (lib)
    optionals
    mkIf
    hasAttr
    ;
  inherit (config.plugins) noice snacks fzf-lua;
in
{
  plugins.telescope = {
    enable = true;
    lazyLoad.settings.cmd = [ "Telescopt" ] ++ optionals noice.enable [ "Noice telescope" ];

    highlightTheme = "Catppuccin Mocha";
    keymaps =
      mkIf (fzf-lua.enable && !snacks.enable && (snacks.enable && !hasAttr "picker" snacks.settings))
        {
          "<leader>ff" = {
            action = "find_files";
            options.desc = "Find files";
          };
          "<leader>fh" = {
            action = "help_tags";
            options.desc = "View help tags";
          };
          "<leader>fg" = "live_grep";
          "<leader><space>" = {
            action = "buffers";
            options.desc = "View buffers";
          };
          "<leader>fd" = {
            action = "diagnostics";
            options.desc = "View diagnostics";
          };
          "<leader>fch" = "command_history";
          "<leader>fc" = {
            action = "commands";
            options.desc = "View commands";
          };
          "<leader>fk" = {
            action = "keymaps";
            options.desc = "View keymaps";
          };
          "<leader>f/" = {
            action = "current_buffer_fuzzy_find";
            options.desc = "Fuzzy find in current buffer";
          };
          "<C-p>" = "git_files";
          "<leader>fo" = {
            action = "oldfiles";
            options.desc = "View old files";
          };
          "<C-f>" = "live_grep";
          "<leader>gB" = {
            action = "git_branches";
            options.desc = "View git branches";
          };
          "<leader>gC" = {
            action = "git_commits";
            options.desc = "View git commits";
          };
          "<leader>gs" = {
            action = "git_status";
            options.desc = "View git status";
          };
          "<leader>gS" = {
            action = "git_stash";
            options.desc = "View git stashes";
          };
        };

    extensions = {
      media-files = {
        enable = true;
        settings = {
          filetypes = [
            "png"
            "jpg"
            "jepg"
            "webp"
            "gif"
          ];
          find_cmd = "rg";
        };
      };
    };

    settings.defaults = {
      pickers.colorschemes.enable_preview = true;
      file_ignore_patterns = [
        "^.git/"
        "^.mypy_cache/"
        "^__pycache__/"
        "^output/"
        "^data/"
        "%.ipynb"
      ];
      set_env.COLORTERM = "truecolor";
    };
  };
}
