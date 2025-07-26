{ config, lib, ... }:
{
  imports = [
    ./comment.nix
    ./diff.nix
    ./git.nix
    ./indentscope.nix
    ./map.nix
    ./pairs.nix
    ./surround.nix
  ];
  plugins.mini = {
    enable = true;
    mockDevIcons = true;
    modules = {
      ai = { };
      align = { };
      basics = { };
      bracketed = { };
      icons = { };
      snippets.snippets = {
        __unkeyed-1.__raw =
          lib.mkIf config.plugins.friendly-snippets.enable # lua
            "require('mini.snippets').gen_loader.from_file('${config.plugins.friendly-snippets.package}/snippets/global.json')";
        __unkeyed-2.__raw = "require('mini.snippets').gen_loader.from_lang()";
      };
    };
  };
}
