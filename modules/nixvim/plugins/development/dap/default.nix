# nvim-dap (Debug Adapter Protocol) - Neovim 的调试器前端，
# 支持断点、变量查看、调用栈等调试功能，
# 可对接 codelldb (C/C++/Rust)、Go Delve、Python 等多种调试后端
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
    lazyLoad.settings = import ./lazy.nix;
    adapters = {
      servers.codelldb = rec {
        port = 13000;
        executable = {
          command = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
          args = [
            "--port"
            "${toString port}"
          ];
        };
      };
      executables = {
        lldb = {
          command = lib.getExe' pkgs.lldb "lldb-dap";
        };
      };
    };

    # configurations = import ./comfigurations.nix { inherit lib config pkgs; };
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
  keymaps = lib.mkIf (dap.enable && !dap.lazyLoad.enable) (import ./keymaps.nix);
}
