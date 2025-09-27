{
  plugins.lint = {

    enable = true;

    lazyLoad.settings.event = "DeferredUIEnter";
    lintersByFt = import ./by-lang.nix;
    linters = ./linters.nix;
  };
}
