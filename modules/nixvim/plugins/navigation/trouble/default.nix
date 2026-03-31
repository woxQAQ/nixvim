# trouble.nvim - 诊断列表和快速修复面板，
# 将 LSP 诊断、代码操作、书签等汇总到统一的列表中，
# 提供类似 IDE 的「问题」面板，支持按类型过滤和导航
{
  plugins.trouble = {
    enable = true;

    lazyLoad.settings.cmd = [ "Trouble" ];
    settings = import ./settings.nix;
  };
  keymaps = import ./keymaps.nix;
}
