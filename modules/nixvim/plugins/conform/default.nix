{
  plugins.conform-nvim = {
    enable = true;
    autoInstall = {
      enable = true;
    };
    lazyLoad.settings = {
      cmd = [
        "Conform"
      ];
      event = [ "BufWritePre" ];
    };

    settings = import ./settings.nix;
  };
  keymaps = import ./keymaps.nix;
  userCommands = import ./format_cmd.nix;
}
