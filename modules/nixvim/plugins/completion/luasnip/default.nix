# LuaSnip - 基于 Lua 的代码片段引擎，
# 支持代码片段的展开、跳转和动态生成，与 LSP 补全集成
{
  plugins.luasnip = {
    enable = false;
    lazyLoad.settings.event = "InsertEnter";
    settings = {
      snippets = {
        expand.__raw = "function(snippet) require('luasnip').lsp_expand(snippet) end";
        active.__raw = ''
          function(filter)
            if filter and filter.direction then
              return require('luasnip').jumpable(filter.direction)
            end
            return require('luasnip').in_snippet()
          end
        '';
        jump.__raw = "function(direction) require('luasnip').jump(direction) end";
      };
    };
  };
}
