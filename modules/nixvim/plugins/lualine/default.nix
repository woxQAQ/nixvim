_: {
  plugins.lualine = {
    enable = true;

    lazyLoad.settings.event = [
      "VimEnter"
      "BufReadPost"
      "BufNewFile"
    ];

    settings =
      let
        separators = {
          left = "";
          right = "";
        };
        transparent = {
          a.fg = "none";
          c.bg = "none";
        };
      in
      {
        sections = {
          lualine_a = [
            "mode"
          ];
          lualine_b = [ "branch" ];
          lualine_c = [
            "filename"
            "diff"
          ];
          lualine_x = [
            {
              __raw = ''Snacks.profiler.status()'';
            }
            {
              __unkeyed-1 = "diagnostics";
              diagnostics_color = {
                error = {
                  fg = "#ed8796";
                };
                warn = {
                  fg = "#eed49f";
                };
                info = {
                  fg = "#8aadf4";
                };
                hint = {
                  fg = "#a6da95";
                };
              };
              colored = true;
            }
            "encoding"
            "fileformat"
            "filetype"
          ];
          lualine_y = [ "progress" ];
          lualine_z = [ "location" ];
        };
        winbar = {
          lualine_x = [
            {
              __unkeyed-1 = "filename";
              newfile_status = true;
              path = 3;
              # Shorten path names to fit navic component
              shorting_target = 150;
              symbols = {
                modified = "";
                readonly = "";
                newfile = "";
              };
            }
          ];
        };
        options = {
          globalstatus = true;
          icons_enable = true;
          always_divide_middle = true;
          component_separators = separators;
          section_separators = separators;
          disabled_filetypes = {
            __unkeyed-1 = "startify";
            __unkeyed-2 = "neo-tree";
            __unkeyed-3 = "copilot-chat";
            __unkeyed-4 = "ministarter";
            __unkeyed-5 = "Avante";
            __unkeyed-6 = "AvanteInput";
            __unkeyed-7 = "trouble";
            __unkeyed-8 = "dapui_scopes";
            __unkeyed-9 = "dapui_breakpoints";
            __unkeyed-10 = "dapui_stacks";
            __unkeyed-11 = "dapui_watches";
            __unkeyed-12 = "dapui_console";
            __unkeyed-13 = "dashboard";
            __unkeyed-14 = "snacks_dashboard";
            __unkeyed-15 = "AvanteSelectedFiles";
            winbar = [
              "aerial"
              "dap-repl"
              "dap-view"
              "dap-view-term"
              "neotest-summary"
            ];
          };
          theme =
            let
              mode = [
                "normal"
                "insert"
                "visual"
                "replace"
                "command"
                "inactive"
              ];
            in
            builtins.listToAttrs (
              map (_m: {
                name = _m;
                value = transparent;
              }) mode
            );
          extensions = [
            "fzf"
            "neo-tree"
          ];
        };
      };
  };
}
