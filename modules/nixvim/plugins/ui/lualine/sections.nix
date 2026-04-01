{
  lualine_a = [ "mode" ];
  lualine_b = [
    {
      __unkeyed-1 = "branch";
      fmt.__raw = ''
        function(name, _)
          -- truncate branch name in case the name is too long
          return string.sub(name, 1, 20)
        end
      '';
      color.gui = "italic,bold";
    }
    {
      __unkeyed-1.__raw = ''
        function()
          local ahead = vim.fn.systemlist("git rev-list --count @{upstream}..HEAD 2>/dev/null")[1]
          local behind = vim.fn.systemlist("git rev-list --count HEAD..@{upstream} 2>/dev/null")[1]
          ahead = tonumber(ahead) or 0
          behind = tonumber(behind) or 0
          local msg = ""
          if ahead > 0 then msg = msg .. string.format("↑[%d] ", ahead) end
          if behind > 0 then msg = msg .. string.format("↓[%d] ", behind) end
          return msg
        end
      '';
      color.fg = "#B36B00";
    }
    {
      icon = "❄ ";
      __unkeyed-1.__raw = ''
        function()
          local env = vim.env.VIRTUAL_ENV
          if env then
            return vim.fs.basename(env)
          end
          if vim.env.IN_NIX_SHELL then
            local name = vim.env.name
            if name and name ~= "" and name ~= "nix-shell" then
              return "(impure)" .. name
            end
            if vim.env.IN_NIX_SHELL == "pure" then
              return "(pure)"
            end
            return "nix"
          end
          return ""
        end
      '';
      color = {
        fg = "black";
        bg = "#F1CA81";
      };
    }
    "diff"
  ];
  lualine_c = [
    {
      __unkeyed-1 = "%S";
      color = {
        gui = "bold";
        fg = "cyan";
      };
    }
    {
      __unkeyed-1 = "diagnostics";
      sources = [ "nvim_lsp" ];
      symbols = {
        error = " ";
        warn = " ";
        info = " ";
        hint = "󰝶 ";
      };
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
  ];

  lualine_x = [
    { __raw = "Snacks.profiler.status()"; }
    {
      __unkeyed-1 = "filename";
      symbols = {
        readonly = "[🔒]";
      };
    }
  ];
  lualine_y = [
    {
      __unkeyed-1 = "filetype";
      icon_only = true;
      separator = "";
      padding = {
        left = 1;
        right = 0;
      };
    }
    {
      __unkeyed-1 = "fileformat";
      symbols = {
        unix = "unix";
        dos = "win";
        mac = "mac";
      };
    }

  ];

  lualine_z = [
    {
      __unkeyed-1 = "progress";
    }
    {
      __unkeyed-1 = "location";
      cond.__raw = ''
        function()
          local cache = {}
          return function()
            local bufnr = vim.api.nvim_get_current_buf()
            if cache[bufnr] == nil then
              local buf_size = vim.api.nvim_buf_get_offset(bufnr, vim.api.nvim_buf_line_count(bufnr))
              cache[bufnr] = buf_size < 1024 * 1024 -- 1MB limit
              -- Clear cache on buffer unload
              vim.api.nvim_create_autocmd("BufUnload", {
                buffer = bufnr,
                callback = function() cache[bufnr] = nil end,
              })
            end
            return cache[bufnr]
          end
        end
      '';
    }
  ];
}
