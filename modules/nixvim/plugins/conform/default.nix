{
  plugins.conform-nvim = {
    enable = true;
    autoInstall = {
      enable = true;
    };
    lazyLoad.settings = {
      cmd = [
        "Conformodules/khmInfo"
      ];
      event = [ "BufWritePre" ];
    };

    # xdluaConfig.pre = ''
    #   local slow_format_filetypes = {}
    # '';
    settings = import ./settings.nix;
  };
  keymaps = import ./keymaps.nix;
  userCommands = import ./format_cmd.nix;
}
