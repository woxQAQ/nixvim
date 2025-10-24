{ flake }:
_final: prev:
let
  nixpkgs = import flake.inputs.nixpkgs {
    inherit (prev.stdenv) system;
    config = {
      allowUnfree = true;
      allowAliases = false;
    };
  };
  inherit (nixpkgs) luaPackages;
in
{
  luaPackages = luaPackages // {
    neotest = luaPackages.neotest.override {
      doCheck = false;
    };
  };
}
