{
  plugins.lualine = {
    enable = true;

    lazyLoad.settings.event = [
      "VimEnter"
      "BufReadPost"
      "BufNewFile"
    ];

    settings = {
      options = {
        disabledFiletypes = {
          statusline = [
            "startup"
            "alpha"
          ];
        };

        theme = "catppuccin";
        globalstatus = true;
      };
      sections = import ./sections.nix;
    };
  };
}
