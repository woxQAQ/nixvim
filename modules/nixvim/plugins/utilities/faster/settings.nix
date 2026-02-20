{ lib, config, ... }:
let
  inherit (config.plugins)
    bufferline
    gitsigns
    mini
    noice
    snacks
    ;
in
{
  behaviours = {
    bigfile = {
      on = true;
      features_disabled = [
        "filetype"
        "illuminate"
        "indent_blankline"
        "lsp"
        "matchparen"
        "syntax"
        "treesitter"
        "vimopts"
      ]
      ++ lib.optionals bufferline.enable [ "bufferline" ]
      ++ lib.optionals gitsigns.enable [ "gitsigns" ]
      ++ lib.optionals mini.enable [ "mini_indentscope" ]
      ++ lib.optionals noice.enable [ "noice" ]
      ++ lib.optionals snacks.enable [ "snacks" ];
      filesize = 2;
      pattern = "*";
      extra_patterns = [
        # More aggressive for log files
        {
          filesize = 1;
          pattern = "*.log";
        }
        # Even more aggressive for large data files
        {
          filesize = 0.5;
          pattern = "*.{csv,json,xml}";
        }
        # Markdown files can get large with embedded content
        {
          filesize = 1.5;
          pattern = "*.md";
        }
      ];
    };

    fastmacro = {
      on = true;
      features_disabled = [
        "illuminate"
        "indent_blankline"
        "lualine"
      ]
      ++ lib.optionals bufferline.enable [ "bufferline" ]
      ++ lib.optionals mini.enable [ "mini_indentscope" ]
      ++ lib.optionals noice.enable [ "noice" ];
    };
  };

  features = {
    noice = {
      on = noice.enable;
      defer = false;
      enable.__raw = ''
        function()
          if pcall(require, "noice") then
            require("noice").enable()
          end
        end
      '';
      disable.__raw = ''
        function()
          if pcall(require, "noice") then
            require("noice").disable()
          end
        end
      '';
      commands.__raw = ''
        function()
          vim.api.nvim_create_user_command("FasterEnableNoice", function()
            if pcall(require, "noice") then
              require("noice").enable()
            end
          end, {})
          vim.api.nvim_create_user_command("FasterDisableNoice", function()
            if pcall(require, "noice") then
              require("noice").disable()
            end
          end, {})
        end
      '';
    };

    gitsigns = {
      on = gitsigns.enable;
      defer = false;
      enable.__raw = ''
        function()
          if pcall(require, "gitsigns") then
            require("gitsigns").toggle_signs(true)
            require("gitsigns").toggle_current_line_blame(true)
          end
        end
      '';
      disable.__raw = ''
        function()
          if pcall(require, "gitsigns") then
            require("gitsigns").toggle_signs(false)
            require("gitsigns").toggle_linehl(false)
            require("gitsigns").toggle_word_diff(false)
            require("gitsigns").toggle_current_line_blame(false)
          end
        end
      '';
      commands.__raw = ''
        function()
          vim.api.nvim_create_user_command("FasterEnableGitsigns", function()
            if pcall(require, "gitsigns") then
              require("gitsigns").toggle_signs(true)
              require("gitsigns").toggle_current_line_blame(true)
            end
          end, {})
          vim.api.nvim_create_user_command("FasterDisableGitsigns", function()
            if pcall(require, "gitsigns") then
              require("gitsigns").toggle_signs(false)
              require("gitsigns").toggle_linehl(false)
              require("gitsigns").toggle_word_diff(false)
              require("gitsigns").toggle_current_line_blame(false)
            end
          end, {})
        end
      '';
    };

    bufferline = {
      on = bufferline.enable;
      defer = false;
      enable.__raw = ''
        function()
          if pcall(require, "bufferline") then
            vim.opt.showtabline = 2
          end
        end
      '';
      disable.__raw = ''
        function()
          vim.opt.showtabline = 0
        end
      '';
      commands.__raw = ''
        function()
          vim.api.nvim_create_user_command("FasterEnableBufferline", function()
            if pcall(require, "bufferline") then
              vim.opt.showtabline = 2
            end
          end, {})
          vim.api.nvim_create_user_command("FasterDisableBufferline", function()
            vim.opt.showtabline = 0
          end, {})
        end
      '';
    };

    mini_indentscope = {
      on = mini.enable;
      defer = false;
      enable.__raw = ''
        function()
          if pcall(require, "mini.indentscope") then
            vim.g.miniindentscope_disable = false
          end
        end
      '';
      disable.__raw = ''
        function()
          vim.g.miniindentscope_disable = true
        end
      '';
      commands.__raw = ''
        function()
          vim.api.nvim_create_user_command("FasterEnableMiniIndentscope", function()
            vim.g.miniindentscope_disable = false
          end, {})
          vim.api.nvim_create_user_command("FasterDisableMiniIndentscope", function()
            vim.g.miniindentscope_disable = true
          end, {})
        end
      '';
    };

    snacks = {
      on = snacks.enable;
      defer = false;
      enable.__raw = ''
        function()
          if pcall(require, "snacks") then
            local snacks = require("snacks")
            if snacks.scroll then snacks.scroll.enable() end
            if snacks.indent then snacks.indent.enable() end
          end
        end
      '';
      disable.__raw = ''
        function()
          if pcall(require, "snacks") then
            local snacks = require("snacks")
            if snacks.scroll then snacks.scroll.disable() end
            if snacks.indent then snacks.indent.disable() end
          end
        end
      '';
      commands.__raw = ''
        function()
          vim.api.nvim_create_user_command("FasterEnableSnacks", function()
            if pcall(require, "snacks") then
              local snacks = require("snacks")
              if snacks.scroll then snacks.scroll.enable() end
              if snacks.indent then snacks.indent.enable() end
            end
          end, {})
          vim.api.nvim_create_user_command("FasterDisableSnacks", function()
            if pcall(require, "snacks") then
              local snacks = require("snacks")
              if snacks.scroll then snacks.scroll.disable() end
              if snacks.indent then snacks.indent.disable() end
            end
          end, {})
        end
      '';
    };
  };
}
