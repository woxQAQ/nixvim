{ lib, self }:
let
  by-name = ./plugins;
  plugins = lib.attrsets.foldlAttrs (
    prev: name: type:
    prev ++ lib.lists.optional (type == "directory") (by-name + "/${name}")
  ) [ ] (builtins.readDir by-name);
in
{
  imports = plugins ++ [
    ./autocommands.nix
    ./keymaps.nix
    ./options.nix
    ./plugins
    ./performance.nix
    ./ft.nix
    ./diagnostics.nix
    ./lsp.nix
  ];
}
