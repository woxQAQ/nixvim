{ ... }:
{
  imports = [ ./keymaps.nix ];
  plugins = {
    fastaction = {
      enable = true;

      # Rely on lzn-auto-require or just setup keymaps in here?
      lazyLoad.settings.lazy = true;
    };
  };
}
