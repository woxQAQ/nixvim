{
  plugins.comment-box = {
    enable = true;
    lazyLoad.settings.cmd = [
      "CBd"
      "CBccbox"
      "CBllline"
      "CBline"
    ];
  };

  keymaps = import ./keymaps.nix;
}
