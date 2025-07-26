{ config, ... }:
{
  imports = [
    ./bufdelete.nix
    ./dashboard.nix
    ./gitbrowse.nix
    ./lazygit.nix
    ./picker.nix
    ./profiler.nix
  ];
  plugins.snacks = {
    enable = true;
    settings = {
      image.enabled = true;
      indent.enabled = true;
      scroll.enabled = true;
      statuscolumn = {
        enabled = true;

        folds = {
          open = true;
          git_hl = config.plugins.gitsigns.enable;
        };
      };
    };
  };
}
