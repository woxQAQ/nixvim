{
  cmdline = {
    completion = {
      menu.auto_show = true;
    };
    keymap = {
      "<Enter>" = [
        "select_and_accept"
        "fallback"
      ];
    };
  };
  fuzzy = {
    implementation = "prefer_rust_with_warning";
  };
  appearance = {
    nerd_font_variant = "moni";
  };
  snippets.preset = "luasnip";
  keymap = {
    preset = "default";
    "<Enter>" = [
      "select_and_accept"
      "fallback"
    ];
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
      "omni"
    ];
    providers = {
      dictionary = {
        module = "blink-cmp-dictionary";
        name = "blink-cmp-dictionary";
        score_offset = 0;
        dictionary_search_threshold = 3;
        definition_pointers = [
          "!"
          "&"
          "^"
        ];
      };
      thesaurus = {
        module = "blink-cmp-words.thesaurus";
        name = "Thesaurus";
        score_offset = 0;
        similarity_depth = 2;
        definition_pointers = [
          "!"
          "&"
          "^"
        ];
        similarity_pointers = [
          "&"
          "^"
        ];
      };
    };
  };
  completion = {
    documentation = {
      auto_show = true;
    };
  };
}
