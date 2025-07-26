{ config, lib }:
let
  inherit (lib) mkIf hasAttr;
  inherit (config.plugins) mini;
in
{
  keymaps =
    mkIf mini.enable
    && hasAttr mini.modules "git" [
      {
        mode = "";
        key = "<leader>gH";
        action = "<CMD>lua MiniGit.show_range_history()<CR>";
        options = {
          desc = "Show range history";
        };
      }
      {
        mode = "n";
        key = "<leader>g.";
        action = "<CMD>lua MiniGit.show_at_cursor()<CR>";
        options = {
          desc = "Show git context";
        };
      }
    ];
}
