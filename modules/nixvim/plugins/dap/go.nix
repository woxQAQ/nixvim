{ lib, pkgs, ... }:
{
  dap-go = {
    enable = true;
    settings.delve.path = "${lib.getExe pkgs.delve}";
  };
}
