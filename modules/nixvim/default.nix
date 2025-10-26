{ lib, self, ... }:
let
  inherit (builtins) readDir;
  _plugins = lib.pipe (readDir ./plugins) [
    (lib.filterAttrs (_name: type: type == "directory"))
    lib.attrNames
    (map (name: ./plugins + "/${name}"))
  ];
in
{
  imports = _plugins ++ [
    # keep-sorted start
    ./autocommands.nix
    ./color.nix
    ./diagnostics.nix
    ./ft.nix
    ./keymaps.nix
    ./lsp.nix
    ./options.nix
    ./performance.nix
    # keep-sorted end
  ];
  nixpkgs = {
    overlays = lib.attrValues self.overlays;
    config = {
      allowUnfree = true;
      allowAliases = false;
    };
  };
}
