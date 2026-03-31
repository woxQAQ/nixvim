# mini.nvim - 一组小型、快速、功能独立的 Neovim 模块集合，
# 此处配置了: indentscope (缩进指示线)、comment (注释切换)、
# bracketed (括号跳转)、basics (基本增强)、mini-ai (文本对象)
# 以及 mini-icons (图标)、mini-align (文本对齐)
{
  ...
}:
{
  imports = [
    ./starter.nix
    ./surround.nix
    ./maps.nix
    ./pairs.nix
  ];

  plugins = {
    mini.enable = true;
    mini.modules = {
      basics = { };
      bracketed = { };
      comment.mappings = {
        comment = "<leader>/";
        comment_line = "<leader>/";
        comment_visual = "<leader>/";
        textobject = "<leader>/";
      };
      indentscope = {
        symbol = "│";
        options = {
          try_as_border = true;
        };
      };
    };

    mini-ai.enable = false;
    mini-align.enable = true;
    mini-icons = {
      enable = true;
      mockDevIcons = true;
    };
  };
}
