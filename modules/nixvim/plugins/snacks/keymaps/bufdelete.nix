{ config, lib, ... }:
{
  keymaps =
    lib.mkIf
      (
        config.plugins.snacks.enable
        && lib.hasAttr "bufdelete" config.plugins.snacks.settings
        && config.plugins.snacks.settings.bufdelete.enabled
      )
      [
        {
          mode = "n";
          key = "<C-w>";
          action = ''<cmd>lua Snacks.bufdelete.delete()<cr>'';
          options = {
            desc = "Close buffer";
          };
        }
        {
          mode = "n";
          key = "<leader>bc";
          action = ''<cmd>lua Snacks.bufdelete.other()<cr>'';
          options = {
            desc = "Close all buffers but current";
          };
        }
        {
          mode = "n";
          key = "<leader>bC";
          action = ''<cmd>lua Snacks.bufdelete.all()<cr>'';
          options = {
            desc = "Close all buffers";
          };
        }
      ];
}
