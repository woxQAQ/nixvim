# nvim-bqf (Better Quickfix) - 增强 quickfix 列表，
# 在 quickfix 窗口中提供预览、自动调整高度、
# 自定义搜索和列表过滤等功能
{
  plugins.nvim-bqf = {
    enable = true;
    settings = {
      auto_resize_height = false;
      preview = {
        auto_preview = false;
      };
    };
  };
}
