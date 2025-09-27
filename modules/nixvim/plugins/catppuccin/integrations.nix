{
  cmp = true;
  dap = {
    enabled = true;
    enable_ui = true;
  };
  dap_ui = true;
  diffview = true;
  fidget = true;
  gitsigns = true;
  harpoon = true;
  headlines = true;
  indent_blankline = {
    enabled = true;
    colored_indent_levels = true;
  };
  lsp_trouble = true;
  markdown = true;
  mini.enabled = true;
  native_lsp = {
    enabled = true;
    virtual_text = {
      errors = [ "italic" ];
      hints = [ "italic" ];
      warnings = [ "italic" ];
      information = [ "italic" ];
    };
    underlines = {
      errors = [ "underline" ];
      hints = [ "underline" ];
      warnings = [ "underline" ];
      information = [ "underline" ];
    };
    inlay_hints = {
      background = true;
    };
    navic = {
      enabled = true;
    };
    neogit = true;
    neotree = false;
    neotest = true;
    noice = true;
    notify = true;
    rainbow_delimiters = true;
    semantic_tokens = true;
    symbols_outline = true;
    telescope = {
      enabled = true;
      style = "nvchad";
    };
    treesitter = true;
    ufo = true;
    which_key = true;
  };
}
