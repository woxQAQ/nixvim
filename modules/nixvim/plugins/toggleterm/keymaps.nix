{ lib, config }:
let
  inherit (config.plugins) toggleterm snacks;
in
{
  keymaps = [
    (lib.mkIf (!snacks.enable || (snacks.enable && snacks.settings.lazygit.enabled)) {
      mode = "n";
      key = "<leader>gg";
      action.__raw = ''
        function()
          local toggleterm = require('toggleterm.terminal')

          toggleterm.Terminal:new({
            cmd = 'lazygit',
            hidden = true
          }):toggle()
        end
      '';
      options = {
        desc = "Open Lazygit";
        silent = true;
      };
    })
  ];
}
