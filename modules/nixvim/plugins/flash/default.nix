{ config, lib, ... }:
{
  imports = [ ./keymaps.nix ];
  plugins = {
    flash = {
      enable = true;

      lazyLoad.settings.event = "DeferredUIEnter";

      settings = {
        modes = {
          char = {
            jump_labels = true;
          };
        };
        search = {
          exclude = [
            "notify"
            "cmp_menu"
            "noice"
            "flash_prompt"
            # "NeogitStatus"
            {
              __raw = ''
                function(win)
                  -- exclude non-focusable windows
                  return not vim.api.nvim_win_get_config(win).focusable
                end
              '';
            }
          ];
        };
      };
    };

    telescope.settings.defaults.mappings =
      let
        flash.__raw = ''
          function(prompt_bufnr)
            require("flash").jump({
              pattern = "^",
              label = { after = { 0, 0 } },
              search = {
                mode = "search",
                exclude = {
                  function(win)
                    return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
                  end,
                },
              },
              action = function(match)
                local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
                picker:set_selection(match.pos[1] - 1)
              end,
            })
          end
        '';
      in
      lib.mkIf config.plugins.flash.enable {
        n = {
          s = flash;
        };
        i = {
          "<c-s>" = flash;
        };
      };

  };
}
