{
  default_format_opts = {
    lsp_format = "fallback";
  };
  format_on_save = # lua
    ''
      function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        -- Disable autoformat for slow filetypes
        if slow_format_filetypes[vim.bo[bufnr].filetype] then
          return
        end

        -- Disable autoformat for files in a certain path
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match("/node_modules/") or bufname:match("/.direnv/") then
          return
        end

        local function on_format(err)
          if err and err:match("timeout$") then
            slow_format_filetypes[vim.bo[bufnr].filetype] = true
          end
        end

        return { timeout_ms = 500, lsp_format = "fallback" }, on_format
      end;
    '';
  format_after_save = # lua
    ''
      function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        if not slow_format_filetypes[vim.bo[bufnr].filetype] then
          return
        end

        return { lsp_fallback = true }
      end
    '';
  formatters_by_ft = import ./formatter.nix;
}
