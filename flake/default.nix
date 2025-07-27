{
  inputs,
  ...
}:
{
  imports = [
    inputs.flake-parts.flakeModules.partitions
    ./nixvim.nix
  ];
  partitions = {
    dev = {
      module = ./dev;
      extraInputsFlake = ./dev;
    };
  };
  partitionedAttrs = {
    checks = "dev";
    devShells = "dev";
    formatter = "dev";
  };
  perSystem =
    {
      config,
      system,
      ...
    }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          allowAliases = false;
        };
      };
      packages.default = config.packages.woxqaqVim;
    };
}
