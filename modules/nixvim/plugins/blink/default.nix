{
  pkgs,
  lib,
  config,
  ...
}:
let
  inherit (lib) elem mkIf optionalString;

in
{
  extraPlugins = with pkgs.vimPlugins; [
    blink-cmp-avante
    blink-cmp-conventional-commits
    blink-cmp-npm-nvim
    blink-nerdfont-nvim
  ];
  plugins = {
    blink-ripgrep.enable = true;
    blink-emoji.enable = true;
    blink-cmp-spell.enable = true;
    blink-cmp-git.enable = true;
  };
  plugins.blink-cmp = {
    enable = true;

    lazyLoad.settings.event = [
      "InsertEnter"
      "CmdlineEnter"
    ];
    settings = {
      appearance = {
        nerd_font_variant = "mono";
        kind_icons = {
          Class = "󱡠";
          Color = "󰏘";
          Constant = "󰏿";
          Constructor = "󰒓";
          Enum = "󰦨";
          EnumMember = "󰦨";
          Event = "󱐋";
          Field = "󰜢";
          File = "󰈔";
          Folder = "󰉋";
          Function = "󰊕";
          Interface = "󱡠";
          Keyword = "󰻾";
          Method = "󰊕";
          Module = "󰅩";
          Operator = "󰪚";
          Property = "󰖷";
          Reference = "󰬲";
          Snippet = "󱄽";
          Struct = "󱡠";
          Text = "󰉿";
          TypeParameter = "󰬛";
          Unit = "󰪚";
          Value = "󰦨";
          Variable = "󰆦";
        };
      };
      completion = {
        accept = {
          auto_brackets = {
            enabled = true;
            semantic_token_resolution = {
              enabled = false;
            };
          };
        };
        appearance = {
          use_nvim_cmp_as_default = true;
        };
        ghost_text.enabled = true;
        list.selection = {
          auto_insert = false;
          window.border = "rounded";
        };
        fuzzy = {
          implementation = "rust";
          prebuilt_binaries = {
            download = false;
          };
        };
        documentation = {
          auto_show = true;
          window.border = "rounded";
        };
        menu = {
          border = "rounded";
        };
      };
      keymap = {
        preset = "enter";
      };
      signature = {
        enabled = true;
        window.border = "rounded";
      };
      sources =
        let
          inherit (config.plugins)
            blink-copilot
            blink-cmp-dictionary
            avante
            blink-emoji
            blink-cmp-spell
            blink-ripgrep
            blink-cmp-git
            ;
          inherit (pkgs.vimPlugins) blink-cmp-conventional-commits blink-nerdfont-nvim blink-cmp-npm-nvim;
        in
        {
          default.__raw = # lua
            ''
              function(ctx)
                -- Base sources that are always available
                local base_sources = { 'buffer', 'lsp', 'path', 'snippets' }

                -- Build common sources list dynamically based on enabled plugins
                local common_sources = vim.deepcopy(base_sources)

                -- Add optional sources based on plugin availability
                ${optionalString blink-copilot.enable # lua
                  "table.insert(common_sources, 'copilot')"
                }
                ${optionalString blink-cmp-dictionary.enable # lua
                  "table.insert(common_sources, 'dictionary')"
                }
                ${optionalString blink-emoji.enable # lua
                  "table.insert(common_sources, 'emoji')"
                }
                ${optionalString (elem blink-nerdfont-nvim config.extraPlugins) # lua
                  "table.insert(common_sources, 'nerdfont')"
                }
                ${optionalString blink-cmp-spell.enable # lua
                  "table.insert(common_sources, 'spell')"
                }
                ${optionalString blink-ripgrep.enable # lua
                  "table.insert(common_sources, 'ripgrep')"
                }
                ${optionalString (elem blink-cmp-npm-nvim config.extraPlugins) # lua
                  ''
                    if vim.fn.expand('%:t') == 'package.json' then
                      table.insert(common_sources, 'npm')
                    end
                  ''
                }

                -- Special context handling
                local success, node = pcall(vim.treesitter.get_node)
                if success and node and vim.tbl_contains({ 'comment', 'line_comment', 'block_comment' }, node:type()) then
                  return { 'buffer', 'spell', 'dictionary' }
                elseif vim.bo.filetype == 'gitcommit' then
                  local git_sources = { 'buffer', 'spell', 'dictionary' }
                  ${optionalString blink-cmp-git.enable # lua
                    "table.insert(git_sources, 'git')"
                  }
                  ${optionalString (elem blink-cmp-conventional-commits config.extraPlugins) # lua
                    "table.insert(git_sources, 'conventional_commits')"
                  }
                  return git_sources
                  ${optionalString avante.enable # Lua
                    ''
                      elseif vim.bo.filetype == 'AvanteInput' then
                        return { 'buffer', 'avante' }
                    ''
                  }
                else
                  return common_sources
                end
              end
            '';
          providers =
            let
              inherit (config.plugins)
                blink-emoji
                blink-ripgrep
                blink-cmp-spell
                avante
                ;
            in
            {
              lsp = {
                score_offset = 4;
              };
              emoji = mkIf blink-emoji.enable {
                module = "blink-emoji";
                name = "Emoji";
                score_offset = 1;
                # Optional configurations
              };
              ripgrep = mkIf blink-ripgrep.enable {
                async = true;
                module = "blink-ripgrep";
                name = "Ripgrep";
                score_offset = 1;
              };
              nerdfont = mkIf (elem pkgs.vimPlugins.blink-nerdfont-nvim config.extraPlugins) {
                module = "blink-nerdfont";
                name = "Nerd Fonts";
                score_offset = 15;
                opts.insert = true;
              };
              spell = mkIf blink-cmp-spell.enable {
                name = "Spell";
                module = "blink-cmp-spell";
                score_offset = 1;
              };
              avante = mkIf avante.enable {
                enable = true;
                name = "Avante";
                enabled.__raw = # lua
                  ''
                    function()
                      return vim.bo.filetype= "Avante"
                    end
                  '';
              };
            };
        };
    };
  };
}
