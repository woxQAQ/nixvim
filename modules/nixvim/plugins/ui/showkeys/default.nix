# showkeys.nvim - 在屏幕上实时显示当前按下的按键组合，
# 用于演示、录制教程或调试键位映射，
# 显示按键后会自动淡出消失
{ config, lib, ... }:
{
  plugins.showkeys = {
    enable = true;

    lazyLoad.settings.cmd = [ "ShowkeysToggle" ];

    settings = {
      position = "top-right";
      timeout = 2;
      maxkeys = 5;
    };
  };

  keymaps = lib.optionals config.plugins.showkeys.enable [
    {
      mode = "n";
      key = "<leader>usk";
      action = "<cmd>ShowkeysToggle<CR>";
      options = {
        desc = "Toggle showkeys";
      };
    }
  ];
}
