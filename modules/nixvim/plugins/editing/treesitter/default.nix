# nvim-treesitter - 基于树解析器的语法高亮、折叠和缩进，
# treesitter-context 显示当前作用域上下文 (如函数名)，
# 是现代 Neovim 配置的核心插件
{
  config,
  pkgs,
  ...
}:
{
  plugins = {
    treesitter = {
      enable = true;

      folding.enable = true;
      highlight.enable = true;
      indent.enable = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        go
        javascript
        typescript
        rust
        python
        cpp
        nu
        diff
        vue

        lua
        nix

        regex
        make

        markdown
        json
        toml
        xml
        yaml
      ];
    };

    treesitter-context = {
      inherit (config.plugins.treesitter) enable;
      lazyLoad.settings.event = [
        "BufReadPost"
        "BufNewFile"
      ];
      settings = {
        max_lines = 4;
        min_window_height = 40;
        multiwindow = true;
        separator = "-";
      };
    };

  };
  keymaps = import ./keymaps.nix;
}
