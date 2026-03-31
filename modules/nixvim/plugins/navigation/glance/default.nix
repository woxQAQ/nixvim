# glance.nvim - LSP 定义/引用预览器，
# 在浮动窗口中显示符号的定义、类型定义、实现和引用列表，
# 替代 barren 了解「跳转到何处」后再跳转的工作流
{
  plugins = {
    glance = {
      enable = true;

      lazyLoad.settings.cmd = "Glance";

      settings = {
        height = 25;
        border.enable = true;
      };
    };
    which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>lg";
        group = "Glance";
        icon = "󰍉";
      }
    ];
  };
  keymaps = import ./keymaps.nix;
}
