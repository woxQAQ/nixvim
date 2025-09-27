{
  lib,
  pkgs,
  self,
  ...
}:
let
  inherit (builtins) toFile toJSON;
  inherit (pkgs.stdenv.hostPlatform) system;
  wrapper = toFile "expr.nix" ''
    import ${./_nixd_expr_.nix} {
      self = ${toJSON self};
      system = ${toJSON system};
    }'';
  withFlake = expr: "with import ${wrapper}; " + expr;
in
{
  lsp.servers.nixd = {
    enable = true;
    settings.settings.nixd = {
      formatting.command = [ "${lib.getExe pkgs.nixfmt}" ];
      nixpkgs.expr = withFlake ''
        import (if local ? lib.version then local else local.inputs.nixpkgs or global.inputs.nixpkgs) { }
      '';
      options = {
        nixvim.expr = withFlake "global.nixvimConfigurations.\${system}.default.options";
        flake-parts.expr = withFlake "local.debug.options or global.debug.options";
      };
    };
  };
}
