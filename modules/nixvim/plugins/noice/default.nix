{ config, lib, ... }:
{
  plugins.noice = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
  };
  plugins.notify = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
  };
  keymaps = lib.mkIf config.plugins.noice.enable [
    {
      mode = "n";
      key = "<leader>fn";
      action =
        let
          # Determine the action based on priority
          hasSnacksPicker =
            config.plugins.snacks.enable && lib.hasAttr "picker" config.plugins.snacks.settings;
          hasFzfLua = config.plugins.fzf-lua.enable;
          hasTelescope = config.plugins.telescope.enable;
        in
        if hasSnacksPicker then
          "<cmd>Noice snacks<CR>"
        else if hasFzfLua then
          "<cmd>Noice fzf<CR>"
        else if hasTelescope then
          "<cmd>Telescope noice<CR>"
        else
          "<cmd>Noice<CR>"; # Fallback to basic Noice command
      options = {
        desc = "Find notifications";
      };
    }
  ];
}
