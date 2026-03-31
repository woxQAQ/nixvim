# hmts.nvim (Hashtag Markup Tree Sitter) - Nix 语言的 Treesitter 语法高亮增强，
# 为 Nix 表达式提供更精确的语法解析和语法高亮
{
  plugins.hmts = {
    # inherit (config.plugins.treesitter) enable;
    enable = false;

    lazyLoad.settings.ft = "nix";
  };
}
