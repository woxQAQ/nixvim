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

    mini-ai.enable = true;
    mini-align.enable = true;
    mini-icons = {
      enable = true;
      mockDevIcons = true;
    };
  };
}
