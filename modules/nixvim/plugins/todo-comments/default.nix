{ lib, config, ... }:
let
  inherit (lib) mkIf hasAttr;
  inherit (config.plugins)
    trouble
    fzf-lua
    snacks
    telescope
    ;
  snakepicker = snacks.enable && !hasAttr "picker" snacks.settings;
in
{
  plugins.todo-comments = {
    enable = true;
    lazyLoad.enable = false;
    settings.signs = true;
    keymaps = {
      todoTrouble.key = mkIf trouble.enable "<leader>xq";
      todoFzfLua = mkIf (fzf-lua.enable && (!snacks.enable || snakepicker)) {
        key = "<leader>ft";
        keywords = [
          "TODO"
          "FIX"
          "FIXME"
        ];
      };
      todoTelescope = mkIf (telescope.enable && !fzf-lua.enable && (!snacks.enable || snakepicker)) {
        key = "<leader>ft";
        keywords = [
          "TODO"
          "FIX"
          "FIXME"
        ];
      };
    };
  };
}
