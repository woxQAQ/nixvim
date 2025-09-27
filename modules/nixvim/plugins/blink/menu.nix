{
  border = "rounded";
  draw = {
    snippet_indicator = "◦";
    columns = [
      {
        __unkeyed-1 = "label";
      }
      {
        __unkeyed-1 = "kind_icon";
        __unkeyed-2 = "kind";
        gap = 1;
      }
      { __unkeyed-1 = "source_name"; }
    ];
    components = {
      kind_icon = {
        ellipsis = false;
        text.__raw = ''
          function(ctx)
            local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
            -- Check for both nil and the default fallback icon
            if not kind_icon or kind_icon == '󰞋' then
              -- Use our configured kind_icons
              return require('blink.cmp.config').appearance.kind_icons[ctx.kind] or ""
            end
            return kind_icon
          end,
        '';
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
    snippets.preset = "mini_snippets";
    keymap = {
      preset = "enter";
      "<C-.>" = [
        "show"
        "show_documentation"
        "hide_documentation"
      ];
    };
    sources = {
      default.__raw = import ./default_sources_lua.nix;
      provider = import ./source_provider.nix;
    };
  };

}
