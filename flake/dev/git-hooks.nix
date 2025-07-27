{ inputs, lib, ... }:
let
  module = inputs.git-hooks-nix;
in
{
  imports = lib.optional (module ? flakeModule) module.flakeModule;

  perSystem =
    { pkgs, ... }:
    lib.optionalAttrs (module ? flakeModule) {
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
