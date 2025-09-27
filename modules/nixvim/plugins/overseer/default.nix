{
  plugins = {
    overseer = {
      enable = true;

      lazyLoad.settings.cmd = [
        "OverseerOpen"
        "OverseerClose"
        "OverseerToggle"
        "OverseerSaveBundle"
        "OverseerLoadBundle"
        "OverseerDeleteBundle"
        "OverseerRunCmd"
        "OverseerRun"
        "OverseerInfo"
        "OverseerBuild"
        "OverseerQuickAction"
        "OverseerTaskAction"
        "OverseerClearCache"
      ];
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>RT";
      action = "<cmd>OverseerRun<CR>";
      options = {
        desc = "Run Tasks";
      };
    }
  ];
}
