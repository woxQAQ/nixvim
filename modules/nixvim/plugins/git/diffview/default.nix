# diffview.nvim - Git 差异查看器，
# 提供 Git difftool 风格的文件比较界面，
# 支持单文件差异、提交历史差异和分支比较
{
  plugins.diffview = {
    enable = true;
  };
  keymaps = import ./keymaps.nix;
}
