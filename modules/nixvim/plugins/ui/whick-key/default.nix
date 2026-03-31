# which-key.nvim - 快捷键提示面板，
# 按下前缀键后弹出所有可用键位映射及其描述，
# 帮助发现和记忆快捷键，支持自定义分组和图标
{
  plugins.which-key = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
  };
}
