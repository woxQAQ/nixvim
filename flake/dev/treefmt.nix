{ inputs, lib, ... }:
let
  module = inputs.treefmt-nix;
in
{
  imports = lib.optional (module ? flakeModule) module.flakeModule;
  perSystem =
    { pkgs, ... }:
    lib.optionalAttrs (module ? flakeModule) {
      treefmt = {
        flakeCheck = true;
        flakeFormatter = true;
        projectRootFile = "flake.nix";
        programs = {
          actionlint.enable = true;
          biome = {
            enable = true;
            settings.formatter.formatWithErrors = true;
          };
          clang-format.enable = true;
          deadnix.enable = true;
          deno = {
            enable = true;
            excludes = [
              "*.ts"
              "*.js"
              "*.json"
              "*.jsonc"
            ];
          };
          fantomas.enable = true;
          gofmt.enable = true;
          isort.enable = true;
          keep-sorted.enable = true;
          nixfmt = {
            enable = true;
            package = pkgs.nixfmt;
          };
          ruff-check.enable = true;
          ruff-format.enable = true;
          rustfmt.enable = true;
          statix.enable = true;
          stylua.enable = true;
          taplo.enable = true;
          yamlfmt.enable = true;
        };
        settings = {
          global.excludes = [
            "*.editorconfig"
            "*.envrc"
            "*.git-blame-ignore-revs"
            "*.gitattributes"
            "*.gitconfig"
            "*.gitignore"
            "*.luacheckrc"
            "*CODEOWNERS"
            "*LICENSE"
            "*flake.lock"
            "assets/*"
            "justfile"
          ];
          formatter.ruff-format.options = [ "--isolated" ];
        };
      };
    };
}
