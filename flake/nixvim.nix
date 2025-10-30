{
  inputs,
  self,
  ...
}:
{
  imports = [
    inputs.nixvim.flakeModules.default
  ];

  nixvim = {
    packages.enable = true;
    checks.enable = false;
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
              ;
          };

          modules = [
            self.nixvimModules.default
          ];
        };
      };
    };
}
