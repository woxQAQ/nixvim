{
  plugins.iron = {
    enable = true;
    lazyLoad.settings.cmd = [
      "IronRepl"
      "IronReplHere"
    ];
    settings = import ./settings.nix;
  };
}
