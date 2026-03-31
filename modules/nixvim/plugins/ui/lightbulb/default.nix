# nvim-lightbulb - 在行号旁显示灯泡图标，
# 当光标所在位置有可用的 LSP 代码操作 (code action) 时显示提示，
# 帮助发现可用的代码改进建议
{
  plugins.nvim-lightbulb = {
    enable = true;

    lazyLoad.settings.event = "DeferredUIEnter";

    settings = {
      autocmd = {
        enabled = true;
        updatetime = 200;
      };
      line = {
        enabled = true;
      };
      number = {
        enabled = true;
      };
      sign = {
        enabled = true;
        text = " 󰌶";
      };
      status_text = {
        enabled = true;
        text = " 󰌶 ";
      };
    };
  };
}
