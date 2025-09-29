{
  plugins.devdocs = {
    enable = true;
    lazyLoad.settings.cmd = [
      "DevDocs"
    ];
  };
  keymaps = import ./keymaps.nix;
}
