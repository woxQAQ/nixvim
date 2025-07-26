{ lib, config, ... }:
let
  inherit (config.plugins) yazi;
in
{
  imports = [ ./keymaps.nix ];
  plugins.neo-tree = {
    enable = !yazi.enable;
    sources = [
      "filesystem"
      "buffers"
      "git_status"
      "document_symbols"
    ];
    addBlankLineAtTop = false;

    closeIfLastWindow = true;
    window = {
      width = 30;
      autoExpandWidth = false;
    };
    filesystem = {
      bindToCwd = false;
      followCurrentFile = {
        enabled = true;
        leaveDirsOpen = false;
      };
      filteredItems = {
        hideDotfiles = false;
        visible = true;
        hideGitignored = false;
      };
    };
  };
}
