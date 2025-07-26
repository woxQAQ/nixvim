{ ... }:
{
  imports = [ ./keymaps/lazygit.nix ];
  plugins.snacks = {
    settings.lazygit.enabled = true;
  };
}
