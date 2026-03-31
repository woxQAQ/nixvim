# comment-box.nvim - 在代码中绘制装饰性的注释框，
# 支持多种样式 (双线框、单线框、虚线等)，用于创建醒目的章节标题注释
{
  plugins.comment-box = {
    enable = true;
    lazyLoad.settings.cmd = [
      # Utils
      "CBd"
      "CBy"
      "CBcatalog"
      # Boxes
      "CBllbox"
      "CBlcbox"
      "CBlrbox"
      "CBclbox"
      "CBccbox"
      "CBcrbox"
      "CBrlbox"
      "CBrcbox"
      "CBrrbox"
      # Lines
      "CBline"
      "CBlline"
      "CBcline"
      "CBrline"
      # Titled Lines
      "CBllline"
      "CBlcline"
      "CBlrline"
      "CBclline"
      "CBccline"
      "CBcrline"
      "CBrlline"
      "CBrcline"
      "CBrrline"
    ];
  };

  keymaps = import ./keymaps.nix;
}
