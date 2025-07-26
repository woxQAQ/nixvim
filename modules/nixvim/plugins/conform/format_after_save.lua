function(bufnr)
  if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
    return
  end

  if not slow_format_filetypes[vim.bo[bufnr].filetype] then
    return
  end

  return { lsp_fallback = true }
end
