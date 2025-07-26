{ inputs, ... }:
{
  imports = [
    inputs.git-hook-nix.flakeModules
  ];

  perSystem =
    { pkgs, ... }:
    {
      pre-commit = {
        check.enable = true;
        settings.hooks = {
          actionlint.enable = true;
          clang-tidy.enable = true;
          deadnix = {
            enable = true;
            settings.edit = true;
          };
          eslint = {
            enable = true;
            packages = pkgs.eslint_d;
          };
          luacheck.enable = true;
          pre-commit-hook-ensure-sops.enable = true;
          statix.enable = true;
          treefmt.enable = true;
          typos.enable = true;
        };
      };
    };
}
