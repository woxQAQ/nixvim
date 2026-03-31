# markdown-preview.nvim - Markdown 实时预览插件，
# 在浏览器中实时预览 Markdown 文件的渲染效果，
# 支持同步滚动、数学公式、代码高亮等
{
  plugins.markdown-preview = {
    enable = true;

    settings = {
      auto_close = 0;
      theme = "dark";
    };
  };

  keymaps = import ./keymaps.nix;
}
