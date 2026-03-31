# 开发工具插件 (DAP 调试、DevDocs 文档、Neotest 测试、Overseer 任务运行、TypeScript 工具)
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
