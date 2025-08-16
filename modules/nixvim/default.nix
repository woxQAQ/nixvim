{ lib, ... }:
let
  inherit (builtins) readDir;
  inherit (lib.attrsets) foldAttrs;
  _plugins = foldAttrs (
      prev: name: type:
      prev ++ lib.lists.optional (type == "directory") (./plugins + "/${name}")
    ) [ ] (readDir ./plugins);
in
{
  imports = _plugins ++ [
    ./autocommands.nix
    ./color.nix
    ./keymaps.nix
    ./lsp.nix
    ./options.nix
    ./performance.nix
    ./todo.nix
  ];
  nixpkgs = {
    config.allowUnfree = true;
  };
}
