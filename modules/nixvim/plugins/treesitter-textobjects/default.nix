{ config, ... }:
let
  hasMiniAi = config.plugins.mini-ai.enable;
in
{
  plugins.treesitter-textobjexts = {
    enable = true;
    settings = {
      # Disable 'select' if mini-ai is enabled to avoid conflict on 'a'/'i' keys
      select = {
        enable = !hasMiniAi;
        lookahead = true;
        selection_modes = {
          "@parameter.outer" = "v";
          "@function.outer" = "V";
        };
      };

      move = {
        enable = true;
        set_jumps = true;

        goto_next_start = {
          "]m" = "@function.outer";
          "]c" = "@class.outer";
          "]o" = {
            query = "@loop.*";
            query_group = "textobjects";
          };
          "]s" = {
            query = "@local.scope";
            query_group = "locals";
          };
          "]z" = {
            query = "@fold";
            query_group = "folds";
          };
        };
        goto_next_end = {
          "]M" = "@function.outer";
          "]C" = "@class.outer";
        };
        goto_previous_start = {
          "[m" = "@function.outer";
          "[c" = "@class.outer";
          "[o" = {
            query = "@loop.*";
            query_group = "textobjects";
          };
        };
        goto_previous_end = {
          "[M" = "@function.outer";
          "[C" = "@class.outer";
        };
      };
    };
  };
  keymaps = import ./keymaps.nix;
}
