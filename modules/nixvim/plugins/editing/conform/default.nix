# conform.nvim - 轻量级异步代码格式化插件，
# 支持按文件类型配置格式化器，在保存时自动格式化，
# 替代 null-ls 和 formatter.nvim，支持 prettier、shfmt、goimports 等多种格式化工具
{
  plugins.conform-nvim = {
    enable = true;
    autoInstall = {
      enable = true;
    };
    lazyLoad.settings = {
      cmd = [
        "ConformInfo"
      ];
      event = [ "BufWritePre" ];
    };
    luaConfig.pre = ''
      local slow_format_filetypes = {}
    '';

    settings = import ./settings.nix;
  };
  keymaps = import ./keymaps.nix;
  userCommands = import ./format_cmd.nix;
}
