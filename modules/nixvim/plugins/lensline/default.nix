{
  plugins.lensline = {
    enable = true;
    settings = import ./settings.nix;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ul";
      action = "<cmd>LenslineToggle<CR>";
      options = {
        desc = "Lensline toggle";
      };
    }
  ];
}
