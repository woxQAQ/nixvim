{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        name = "";
        packages = with pkgs; [
          deadnix
          nixd
          nixfmt
          statix
        ];
      };
    };
}
