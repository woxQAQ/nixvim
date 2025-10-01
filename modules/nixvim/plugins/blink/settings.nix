{
  lib,
  config,
  pkgs,
  ...
}:
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

  signature = {
    enabled = true;
    window.border = "rounded";
  };
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
      "buffer"
      "path"
      "git"
      "calc"
      "omni"
    ];
    providers = (import ./source_provider.nix) {
      inherit lib config pkgs;
    };
  };
  completion = {
    menu = import ./menu.nix;

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
      window.border = "rounded";
    };
    list.selection = {
      auto_insert = true;
      preselect = false;
    };
  };

}
