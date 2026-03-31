# faster.nvim - Neovim 启动和运行时性能分析优化插件，
# 通过 Lua 虚拟机和内部 API 加速常用操作，
# 减少延迟并提升编辑器整体响应速度
{ lib, config, ... }:
{
  plugins.faster = {
    enable = true;

    lazyLoad.settings = {
      event = [
        "DeferredUIEnter"
      ];
    };
    settings = import ./settings.nix { inherit lib config; };
  };
}
