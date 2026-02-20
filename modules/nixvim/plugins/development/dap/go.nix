{ lib, pkgs, ... }:
{
  plugins.dap-go = {
    enable = true;
    settings.delve.path = "${lib.getExe pkgs.delve}";
  };
}
