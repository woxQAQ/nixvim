# DevDocs - 在 Neovim 中浏览 DevDocs.io 的离线 API 文档，
# 支持多种语言和框架的文档查询
{
  plugins.devdocs = {
    enable = true;
    lazyLoad.settings.cmd = [
      "DevDocs"
    ];
  };
  keymaps = import ./keymaps.nix;
}
