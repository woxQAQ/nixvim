{ mylib, lib, ... }:
let
  inherit (builtins) readDir;
  inherit (lib.attrsets) foldAttrs;
  _plugins = (
    foldAttrs (
      prev: name: type:
      prev ++ lib.lists.optional (type == "directory") (./plugins + "/${name}")
    ) [ ] (readDir ./plugins)
  );
in
{
  imports = _plugins ++ [
    ./plugins
    ./autocommands.nix
    ./color.nix
    ./keymaps.nix
    ./options.nix
    ./todo.nix
    ./lsp.nix
  ];
  nixpkgs = {
    config.allowUnfree = true;
  };
}
