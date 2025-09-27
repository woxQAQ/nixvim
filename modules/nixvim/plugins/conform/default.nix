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

    xdluaConfig.pre = ''
      local slow_format_filetypes = {}
    '';
    settings = builtins.readFile ./settings.nix;
  };
  keymaps = builtins.readFile ./keymaps.nix;
  userCommands = builtins.readFile ./format_cmd.nix;
}
