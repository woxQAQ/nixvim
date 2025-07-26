{ }:
{
  plugins.colorizer = {
    enable = true;
    lazyLoad.settings.cmd = "ColorizerToggle";
    settings.user_default_options.names = false;
    settings.filetypes = {
      css = {
        rgb_fn = true;
      };
    };
  };
}
