# nvim-navic - 在 winbar (窗口顶部栏) 显示 LSP 代码位置导航，
# 显示当前光标所在的面包屑路径 (如 类 > 方法 > 变量)，
# 基于 LSP 提供的 DocumentSymbol 信息
{
  plugins.navic = {
    enable = true;

    lazyLoad.settings.event = [
      "BufReadPost"
      "BufNewFile"
    ];
    settings = {
      lsp = {
        auto_attach = true;
      };
      separator = "  ";
      highlight = true;
      depthLimit = 5;
    };
  };
}
