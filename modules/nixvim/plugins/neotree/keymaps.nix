{ lib, config }:
{
  keymaps = lib.mkIf config.plugins.neo-tree.enable [
    {
      mode = "n";
      key = "<leader>e";
      action = ":Neotree action=focus reveal toggle<CR>";
      options.desc = "Explorer toggle";
    }
  ];
}
