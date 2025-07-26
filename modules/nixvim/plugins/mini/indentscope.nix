{ config, lib, ... }:
let
  inherit (config.plugins) mini snacks;
  inherit (lib) mkIf hasAttr;
in
{
  autoCmd = mkIf (mini.enable && hasAttr "indentscope" mini.modules) [
    {
      event = [ "FileType" ];
      pattern = [
        "help"
        "alpha"
        "dashboard"
        "neo-tree"
        "Trouble"
        "trouble"
        "lazy"
        "mason"
        "notify"
        "toggleterm"
        "lazyterm"
        "snacks_dashboard"
      ];
      callback.__raw = ''
        function()
          vim.b.miniindentscope_disable = true
        end
      '';
    }
  ];

  plugins.mini.modules.indentscope = mkIf (
    !hasAttr "indent" snacks.settings || !snacks.settings.indent.enabled
  ) { };
}
