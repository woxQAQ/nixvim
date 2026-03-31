# iron.nvim - 交互式 REPL 管理器，
# 在 Neovim 中运行各种语言的 REPL (Python、R、Haskell 等)，
# 支持发送代码行、选区或整个文件到 REPL 执行
{ lib, pkgs, ... }:
{
  plugins.iron = {
    enable = true;
    lazyLoad.settings.cmd = [
      "IronRepl"
      "IronReplHere"
    ];
    settings = import ./settings.nix { inherit lib pkgs; };
  };
  keymaps = import ./keymaps.nix;
}
