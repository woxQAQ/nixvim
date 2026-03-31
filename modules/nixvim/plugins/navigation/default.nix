# 导航和位置跳转插件 (Glance 定义预览、Harpoon 书签、Trouble 诊断列表)
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
