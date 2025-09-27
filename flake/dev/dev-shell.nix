{
  perSystem =
    { config, pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        name = "nixos config dev shells";
        shellHook = ''
          echo "check precommit install"
          ${config.pre-commit.installationScript}
        '';
        packages = with pkgs; [
          nixfmt
          git
          deadnix
          ruff
        ];
      };
    };
}
