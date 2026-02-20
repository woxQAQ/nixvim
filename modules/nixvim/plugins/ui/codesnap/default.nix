{ pkgs, ... }:
{
  plugins.codesnap = {
    enable = true;
    package = pkgs.vimPlugins.codesnap-nvim;
    lazyLoad.settings.cmd = [
      "CodeSnap"
      "CodeSnapSave"
      "CodeSnapHighlight"
      "CodeSnapSaveHighlight"
    ];
    settings = {
      snapshot_config = {
        code_config = {
          font_family = "Maple Mono NF CN";
          breadcrumbs = {
            enable = true;
            separator = "/";
          };
        };
        show_line_number = false;
        snapshot_config = {
          window = {
            mac_window_bar = true;
          };
        };
        watermark.content = "";
      };
    };
  };
  keymaps = import ./keymaps.nix;
}
