# comment-box.nvim - 在代码中绘制装饰性的注释框，
# 支持多种样式 (双线框、单线框、虚线等)，用于创建醒目的章节标题注释
{
  plugins.comment-box = {
    enable = true;
    lazyLoad.settings.cmd = [
      "CBd"
      "CBccbox"
      "CBllline"
      "CBline"
    ];
  };

  keymaps = import ./keymaps.nix;
}
