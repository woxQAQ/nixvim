{ ... }:
{
  imports = [ ./keymaps/gitbrowser.nix ];
  plugins.snacks = {
    settings.gitbrowse.enabled = true;
  };
}
