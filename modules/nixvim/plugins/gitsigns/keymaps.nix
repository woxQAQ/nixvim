{ lib, config, ... }:
let
  hunk = import ./keymaps/hunk.nix;
  blame = import ./keymaps/blame.nix;
  toggle = import ./keymaps/toggle.nix;
in
{
  keymaps =
    lib.mkIf config.plugins.gitsigns.enable [
      {
        mode = "n";
        key = "<leader>gd";
        action = ":Gitsigns diffthis<CR>";
        options.silent = true;
      }
    ]
    ++ hunk
    ++ blame
    ++ toggle;
}
