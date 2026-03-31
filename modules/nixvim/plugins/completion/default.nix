# 自动补全插件 (Blink 补全引擎、LuaSnip 代码片段、Friendly Snippets 等)
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
