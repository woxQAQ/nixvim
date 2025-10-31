# {
#   pkgs,
#   self,
#   ...
# }:
{
  lsp.servers.nixd = {
    enable = true;
    # config.settings.nixd = {
    #   formatting.command = [ "${lib.getExe pkgs.nixfmt}" ];
    #   nixpkgs.expr =
    #     withFlake
    #       #nix
    #       ''
    #         import (if local ? lib.version then local else local.inputs.nixpkgs or global.inputs.nixpkgs) { }
    #       '';
    #   options = {
    #     nixvim.expr = withFlake "global.nixvimConfigurations.\${system}.default.options";
    #     flake-parts.expr = withFlake "local.debug.options or global.debug.options";
    #   };
    # };
  };
}
