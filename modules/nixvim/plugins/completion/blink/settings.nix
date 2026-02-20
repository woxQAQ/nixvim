{
  cmdline = {
    completion = {
      list.selection = {
        preselect = false;
      };
      menu.auto_show = true;
    };
    keymap = {
      preset = "enter";
      "<CR>" = [
        "accept_and_enter"
        "fallback"
      ];
    };
  };
  fuzzy = {
    implementation = "rust";
    sorts = [
      "exact"
      "score"
      "sort_text"
    ];
    prebuilt_binaries = {
      download = false;
    };
  };
  appearance = {
    use_nvim_cmp_as_default = true;
    kind_icons = {
      Copilot = "";

      Text = "";
      Field = "";
      Variable = "";

      Class = "";
      Interface = "";

      TypeParameter = "";
    };
  };

  # signature = {
  #   enabled = true;
  #   window.border = "rounded";
  # };
  snippets.preset = "luasnip";
  keymap = {
    preset = "enter";
    "<A-Tab>" = [
      "snippet_forward"
      "fallback"
    ];
    "<A-S-Tab>" = [
      "snippet_backward"
      "fallback"
    ];
    "<Tab>" = [
      "select_next"
      "fallback"
    ];
    "<S-Tab>" = [
      "select_prev"
      "fallback"
    ];
  };

  sources = {
    default = [
      "lsp"
      "path"
      "buffer"
    ];
  };
  completion = {
    menu = import ./menu.nix;
    trigger = {
      prefetch_on_insert = true;
      show_on_backspace = true;
      # Disabled: Prefer manual completion control with <C-.>
      # Uncomment to auto-show after typing these characters:
      # show_on_x_blocked_trigger_characters = [
      #   " "
      #   ";"
      # ];
    };
    keyword.range = "full";
    ghost_text.enabled = true;
    accept.auto_brackets = {
      override_brackets_for_filetypes = {
        lua = [
          "{"
          "}"
        ];
        nix = [
          "{"
          "}"
        ];
      };
    };
    documentation = {
      auto_show = true;
      auto_show_delay_ms = 200;
      window.border = "rounded";
    };
    list.selection = {
      auto_insert = false;
      preselect = false;
    };
  };

}
