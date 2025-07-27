{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          deadnix
          nixd
          nixfmt
          statix
        ];
        shellHook = # sh
          ''
            echo "woxQAQ vim dev shells"
            echo "Available commands"
            echo "  deadnix -e    - check unused fix codes"
            echo "  static fix .  - fix nix lint issues"
            echo "  nixfmt .      - format nix files"
          '';
      };
    };
}
