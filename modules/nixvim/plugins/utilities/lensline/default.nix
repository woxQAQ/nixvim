# lensline.nvim - 在光标行显示折叠行的内容预览 (lens)，
# 将被折叠的代码以半透明形式显示在折叠行上方，
# 让用户无需展开即可了解被折叠的代码内容
{
  plugins.lensline = {
    enable = true;
    settings = import ./settings.nix;
  };

  keymaps = import ./keymaps.nix;
}
