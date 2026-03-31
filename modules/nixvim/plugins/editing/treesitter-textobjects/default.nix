# nvim-treesitter-textobjects - 基于 Treesitter 的文本对象和跳转，
# 提供 @function、@class 等语义化文本对象选择，
# 以及 ]m ]c 等在函数/类之间跳转的快捷键
{ config, ... }:
let
  hasMiniAi = config.plugins.mini-ai.enable;
in
{
  plugins.treesitter-textobjects = {
    enable = true;
    settings = {
      # Disable 'select' if mini-ai is enabled to avoid conflict on 'a'/'i' keys
      select = {
        enable = !hasMiniAi;
        lookahead = true;
        selection_modes = {
          "@parameter.outer" = "v";
          "@function.outer" = "V";
          "@function.inner" = "V";
          "@class.inner" = "V";
          "@class.outer" = "V";
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
