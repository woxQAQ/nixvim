{
  pkgs,
  lib,
  config,
  ...
}:
let
  inherit (config.plugins) dap;
in
{
  extraPackages = lib.mkIf dap.enable (
    with pkgs;
    [
      coreutils
      lldb
    ]
  );
  imports = [
    ./go.nix
    ./python.nix
    ./ui.nix
  ];
  plugins.dap = {
    enable = true;
    imports = [ ./lazy.nix ];
    servers.codelldb = rec {
      port = 13000;
      executable = {
        command = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
        args = [
          "--port"
          "${port}"
        ];
      };
    };
    configurations = import ./comfigurations.nix;
    signs = {
      dapBreakpoint = {
        text = "";
        texthl = "DapBreakpoint";
      };
      dapBreakpointCondition = {
        text = "";
        texthl = "DapBreakpointCondition";
      };
      dapBreakpointRejected = {
        text = "";
        texthl = "DapBreakpointRejected";
      };
      dapLogPoint = {
        text = "";
        texthl = "DapLogPoint";
      };
      dapStopped = {
        text = "";
        texthl = "DapStopped";
      };
    };
  };
  keymaps = lib.optionals (dap.enable && !dap.lazyLoad.enable) import ./keymaps.nix;
}
