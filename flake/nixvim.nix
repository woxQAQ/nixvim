{
  inputs,
  self,
  ...
}:
let
  nvlib = import ../lib;
in
{
  imports = [
    inputs.nixvim.flakeModules.default
  ];

  nixvim = {
    packages.enable = true;
    checks.enable = true;
  };

  flake.nixvimModules = {
    default = import ../modules/nixvim;
  };

  perSystem =
    { system, ... }:
    {
      nixvimConfigurations = {
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
