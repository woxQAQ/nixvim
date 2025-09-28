{
  plugins.lensline = {
    enable = true;
    settings = import ./settings.nix;
  };

  keymaps = import ./keymaps.nix;
}
