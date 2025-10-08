{
  plugins.navic = {
    enable = true;

    lazyLoad.settings.event = "DeferredUIEnter";

    settings = {
      lsp = {
        auto_attach = true;
      };
      separator = "  ";
      highlight = true;
      depthLimit = 5;
    };
  };
}
