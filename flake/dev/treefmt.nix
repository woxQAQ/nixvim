{ inputs, ... }:
{
  imports = [
    inputs.treefmt-nix.flakeModules
  ];
  perSystem =
    { pkgs, ... }:
    {
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
          ruff-fmt.enable = true;
          rustfmt.enable = true;
          statix.enable = true;
          stylua.enable = true;
          taplo.enable = true;
          yamlfmt.enable = true;
        };
      };
      settings = {
        globals.excludes = [
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
}
