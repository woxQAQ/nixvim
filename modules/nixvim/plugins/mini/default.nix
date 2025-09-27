{
  config,
  lib,
  ...
}:
{
  imports = [
    ./starter.nix
    ./surround.nix
  ];

  plugins = {
    mini = {
      enable = true;

      modules = {
        basics = { };
        bracketed = { };
        comment.mappings = {
          comment = "<leader>/";
          comment_line = "<leader>/";
          comment_visual = "<leader>/";
          textobject = "<leader>/";
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
