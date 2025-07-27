{
  imports = [ ./keymaps/diff.nix ];
  plugins.mini.modules = {
    diff.view.style = "sign";
  };
}
