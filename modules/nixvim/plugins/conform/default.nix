{
  lib,
  pkgs,
  ...
}:
{
  plugins.conform-nvim = {
    enable = true;
    lazyLoad.settings = {
      cmd = [
        "ConformInfo"
      ];
      event = [ "BufWritePre" ];
    };
    luaConfig.pre = ''
      local slow_format_filetypes = {}
    '';
    settings = {
      default_format_opts = {
        lsp_format = "fallback";
      };
      format_on_save = builtins.readFile ./format_on_save.lua;
      format_after_save = builtins.readFile ./format_after_save.lua;
      formatters_by_ft = import ./ft.nix;
      formatter = import ./formatter.nix { inherit pkgs lib; };
      notify_on_error = false;
    };
  };
}
