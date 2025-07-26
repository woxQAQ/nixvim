{
  inputs,
  lib,
  self,
}:
{
  imports = [
    inputs.nixvim.flakeModules.default
    inputs.flake-parts.flakeModules.partitions
  ];
  nixvim = {
    packages.enable = true;
    checks.enable = true;
  };
  flake.nixvimModules = {
    default = "../modules/nixvim/";
  };
  partitions = {
    dev = {
      modules = ./dev;
      extraInputFlake = ./dev;
    };
  };
  partitionedAttrs = {
    check = "dev";
    devShells = "dev";
    formatter = "dev";
  };
  perSystem =
    { config, system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          allowAliases = false;
        };
      };
      packages.default = config.packages.woxqaqVim;
      nixvimConfigurations =
        let
          nvlib = import ../lib;
        in
        {
          woxqaqVim = inputs.nixvim.lib.evalNixvim {
            inherit system;
            extraSpecialArgs = {
              inherit
                inputs
                system
                self
                nvlib
                ;
            };
            modules = [
              self.nixvimModules.default
            ];
          };
        };
    };
}
