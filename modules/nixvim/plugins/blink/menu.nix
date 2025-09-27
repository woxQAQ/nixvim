{
  # FIXME  blink.cmp   completion  →  menu  →  draw  →  snippets  Unexpected field in configuration!
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
  };

}
