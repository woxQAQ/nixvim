{ config, lib, ... }:
{
  plugins.indent-blankline = {
    enable =
      (!lib.hasAttr "indent" config.plugins.snacks.settings)
      || !config.plugins.snacks.settings.indent.enabled;

    lazyLoad.settings.event = "DeferredUIEnter";

    settings = {
      scope.enabled = false;
    };
  };
}
