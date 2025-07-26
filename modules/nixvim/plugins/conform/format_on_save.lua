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

  return { timeout_ms = 200, lsp_fallback = true }, on_format
 end
