# Blink.cmp - 用 Rust 编写的高性能自动补全引擎，
# 支持代码补全、路径补全、字典补全等，是 coc.nvim 和 nvim-cmp 的现代替代方案
let
  mkBlinkPlugin =
    {
      enable ? true,
      ...
    }@args:
    {
      inherit enable;
      lazyLoad.settings.event = [
        "InsertEnter"
        "CmdlineEnter"
      ];
    }
    // (removeAttrs args [ "enable" ]);
in
{
  plugins = {
    blink-cmp = {
      settings = import ./settings.nix;
      enable = true;
      lazyLoad.settings.event = [
        "InsertEnter"
        "CmdlineEnter"
      ];
    };
    blink-cmp-words = mkBlinkPlugin { };
    blink-cmp-dictionary = mkBlinkPlugin { };
  };
}
