{ config, ... }:
{
  imports = [
    ./picker.nix
    ./bigfile.nix
    ./bufdel.nix
    ./gitbrowse.nix
    ./lazygit.nix
    ./profiler.nix
    ./terminal.nix
    ./image.nix
  ];
  plugins.snacks = {
    enable = true;
    settings = {
      image.enabled = true;
      indent.enabled = true;
      scroll.enabled = true;
      scope = {
        enabled = true;
        treesitter.blocks.enabled = true;
      };
      statuscolumn = {
        enabled = true;

        folds = {
          open = true;
          git_hl = config.plugins.gitsigns.enable;
        };
      };
    };
  };

  keymaps = import ./keymaps.nix;
}
