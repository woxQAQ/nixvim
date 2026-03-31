# nvim-lint - 异步代码静态分析 (linter) 框架，
# 支持按文件类型配置多个 linter，在编辑时实时显示代码问题，
# 替代 null-ls 的 lint 功能，支持 eslint、shellcheck、golangci-lint 等
{ lib, pkgs, ... }:
{
  plugins.lint = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
    lintersByFt = import ./by-lang.nix;
    linters = (import ./linters.nix) { inherit lib pkgs; };
  };
}
