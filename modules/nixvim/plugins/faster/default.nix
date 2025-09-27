{ ... }:
{
  plugins.faster = {
    enable = true;

    lazyLoad.settings = {
      event = [
        "DeferredUIEnter"
      ];
    };
    settings = import ./settings.nix;
  };
}
