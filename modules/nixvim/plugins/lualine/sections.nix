{
  lualine_a = [ "mode" ];
  lualine_b = [
    "branch"
    "diff"
  ];
  lualine_c = [
    {
      __unkeyed-1 = "diagnostics";
      sources = [ "nvim_lsp" ];
      symbols = {
        error = " ";
        warn = " ";
        info = " ";
        hint = "󰝶 ";
      };
    }
  ];

  lualine_x = [
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
      __unkeyed-1 = "filename";
      path = 1;
    }
  ];
  lualine_y = [
    {
      __unkeyed-1 = "progress";
    }
  ];
  lualine_z = [
    {
      __unkeyed-1 = "location";
    }
  ];
  #
  # lualine_y = [
  #   (lib.mkIf config.plugins.aerial.enable {
  #     __unkeyed-1 = "aerial";
  #     colored = true;
  #
  #     depth = 3; # Limit depth for better performance
  #     dense = true; # Better for performance
  #     dense_sep = ".";
  #
  #     cond.__raw = ''
  #       function()
  #         local aerial_avail, aerial = pcall(require, "aerial")
  #         return aerial_avail and aerial.has_symbols()
  #       end
  #     '';
  #   })
  # ];

  lualine_z = [
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
