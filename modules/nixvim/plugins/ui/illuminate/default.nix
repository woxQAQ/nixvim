# vim-illuminate - 高亮光标下相同单词的所有出现位置，
# 自动高亮与光标所在单词相同的其他引用，
# 支持自定义高亮延迟和大文件自动禁用
{
  plugins = {
    illuminate = {
      enable = false;
      settings = {
        filetypesDenylist = [
          "dirvish"
          "fugitive"
          "neo-tree"
          "TelescopePrompt"
        ];
        largeFileCutoff = 3000;
      };
    };
  };
}
