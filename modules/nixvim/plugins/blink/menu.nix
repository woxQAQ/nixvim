{
  # FIXME  blink.cmp   completion  →  menu  →  draw  →  snippets  Unexpected field in configuration!
  border = "rounded";
  direction_priority.__raw = ''
    function()
      local ctx = require('blink.cmp').get_context()
      local item = require('blink.cmp').get_selected_item()
      if ctx == nil or item == nil then return { 's', 'n' } end

      local item_text = item.textEdit ~= nil and item.textEdit.newText or item.insertText or item.label
      local is_multi_line = item_text:find('\n') ~= nil

      -- after showing the menu upwards, we want to maintain that direction
      -- until we re-open the menu, so store the context id in a global variable
      if is_multi_line or vim.g.blink_cmp_upwards_ctx_id == ctx.id then
        vim.g.blink_cmp_upwards_ctx_id = ctx.id
        return { 'n', 's' }
      end
      return { 's', 'n' }
    end
  '';
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
