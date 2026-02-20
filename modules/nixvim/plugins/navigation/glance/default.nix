{
  plugins = {
    glance = {
      enable = true;

      lazyLoad.settings.cmd = "Glance";

      settings = {
        border.enable = true;
      };
    };
    which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>lg";
        group = "Glance";
        icon = "󰍉";
      }
    ];
  };
  keymaps = import ./keymaps.nix;
}
