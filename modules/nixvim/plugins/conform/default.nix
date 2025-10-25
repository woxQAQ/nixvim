{
  plugins.conform-nvim = {
    enable = true;
    autoInstall = {
      enable = false;
    };
    lazyLoad.settings = {
      cmd = [
        "Conform"
      ];
      event = [ "BufWritePre" ];
    };
    luaConfig.pre = ''
      local slow_format_filetypes = {}
    '';

    settings = import ./settings.nix;
  };
  keymaps = import ./keymaps.nix;
  # userCommands = import ./format_cmd.nix;
}
