{ ... }:
{
  imports = [
    ./keymaps.nix
    ./which-key-spec.nix
  ];
  plugins.glance = {
    enable = true;
    lazyLoad.settings.cmd = "Glance";
    settings.border.enable = true;
  };
}
