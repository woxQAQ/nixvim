{
  config,
  lib,
  ...
}:
let
  inherit (config.plugins) telescope lz-n;
  inherit (lib) mkIf;
in
{
  imports = [
    ./keymaps.nix
    ./which-key-spec.nix
  ];
  plugins.refactoring = {
    enable = true;
    enableTelescope = telescope.enable;
    lazyLoad.settings = {
      before = mkIf (telescope.enable && lz-n.enable) {
        __raw = ''
          require("lz-n").trigger_load('telescope')
        '';
        cmd = "Refactor";
        keys = mkIf telescope.enable [
          {
            __unkeyed-1 = "<leader>fR";
            __unkeyed-2.__raw = ''
              function()
                require('telescope').extensions.refactoring.refactors()
              end
            '';
            desc = "Refactoring";
          }
        ];
      };
    };
  };
}
