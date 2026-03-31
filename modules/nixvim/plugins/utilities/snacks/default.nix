# snacks.nvim - Folke 出品的多功能实用工具集，
# 集成了: picker (模糊查找器)、bigfile (大文件处理)、
# bufdel (buffer 删除)、gitbrowse (浏览器打开 Git URL)、
# lazygit (LazyGit 集成)、profiler (性能分析)、
# terminal (终端)、image (图片显示)、
# indent (缩进引导)、scroll (平滑滚动)、
# scope (变量作用域高亮)、statuscolumn (状态列)
{ config, ... }:
{
  imports = [
    ./picker.nix
    ./bigfile.nix
    ./bufdel.nix
    ./gitbrowse.nix
    ./lazygit.nix
    ./profiler.nix
    ./terminal.nix
    ./image.nix
  ];
  plugins.snacks = {
    enable = true;
    settings = {
      image.enabled = true;
      indent.enabled = true;
      scroll.enabled = true;
      scope = {
        enabled = true;
        treesitter.blocks.enabled = true;
      };
      statuscolumn = {
        enabled = true;

        folds = {
          open = true;
          git_hl = config.plugins.gitsigns.enable;
        };
      };
    };
  };

  keymaps = import ./keymaps.nix;
}
