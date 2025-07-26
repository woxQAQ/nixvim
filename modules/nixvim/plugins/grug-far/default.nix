{ ... }:
{
  imports = [ ./keymaps.nix ];
  plugins.grug-far = {
    enable = true;
    lazyLoad.settings.cmd = "GrugFar";
  };
}
