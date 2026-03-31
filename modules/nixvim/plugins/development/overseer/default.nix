# Overseer - 异步任务运行和构建工具，
# 用于执行 shell 命令、构建项目、运行测试等，
# 提供任务列表、输出面板和任务模板管理
{
  plugins = {
    overseer = {
      enable = true;

      lazyLoad.settings.cmd = [
        "OverseerOpen"
        "OverseerClose"
        "OverseerToggle"
        "OverseerSaveBundle"
        "OverseerLoadBundle"
        "OverseerDeleteBundle"
        "OverseerRunCmd"
        "OverseerRun"
        "OverseerInfo"
        "OverseerBuild"
        "OverseerQuickAction"
        "OverseerTaskAction"
        "OverseerClearCache"
      ];
    };
  };

  keymaps = import ./keymaps.nix;
}
