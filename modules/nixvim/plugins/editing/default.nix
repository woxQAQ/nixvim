# 编辑增强插件 (格式化、Lint、Treesitter、跳转、括号、撤销树、剪贴板等)
{ lib, ... }:
let
  inherit (builtins) readDir;
  plugins = lib.pipe (readDir ./.) [
    (lib.filterAttrs (_name: type: type == "directory"))
    lib.attrNames
    (map (name: ./. + "/${name}"))
  ];
in
{
  imports = plugins;
}
