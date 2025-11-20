{ pkgs, ... }:
let
  save_path =
    if pkgs.stdenv.isLinux then
      "$XDG_PICTURES_DIR/screenshots"
    else if pkgs.stdenv.isDarwin then
      "$HOME/Pictures"
    else
      "";
in
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
      inherit save_path;
      code_font_family = "Maple Mono NF CN";
      mac_window_bar = true;
      title = "CodeSnap.nvim";
      watermark = "";
      breadcrumbs_separator = "/";
      has_breadcrumbs = true;
      has_line_number = false;
    };
  };
  keymaps = import ./keymaps.nix;
}
