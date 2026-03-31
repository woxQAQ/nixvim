# lz-n + lzn-auto-require - 轻量级插件懒加载框架，
# lz-n 提供类似 lazy.nvim 的延迟加载功能，
# lzn-auto-require 根据 lazyLoad 设置自动生成 require 调用，
# 替代较重的 lazy.nvim，保持启动速度
{
  plugins = {
    lzn-auto-require.enable = true;
    lz-n.enable = true;
  };
}
