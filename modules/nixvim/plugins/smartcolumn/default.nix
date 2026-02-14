{
  plugins.smartcolumn = {
    enable = true;

    lazyLoad.settings.event = [
      "BufReadPost"
      "BufNewFile"
    ];

    settings = {
      colorcolumn = "80";
      disabled_filetypes = [
        "dashboard"
        "snacks_dashboard"
        "ministarter"
        "checkhealth"
        "help"
        "lspinfo"
        "markdown"
        "neo-tree"
        "noice"
        "text"
      ];
      scope = "file";
    };
  };
}
