{
  menu = {
    imports = [ ./menu.nix ];
  };
  cmdline = {
    completion = {
      list.selection = {
        preselect = false;
      };
      menu.auto_show = true;
    };
    keymap = {
      preset = "enter";
      "<CR>" = [
        "accept_and_enter"
        "fallback"
      ];
    };
  };
  completion = {
    keyword.range = "full";
    ghost_test.enabled = true;
    accept.auto_brackets = {
      override_brackets_for_filetypes = {
        lua = [
          "{"
          "}"
        ];
        nix = [
          "{"
          "}"
        ];
      };
    };
    documentation = {
      auto_show = true;
      window.border = "rounded";
    };
    list.selection = {
      auto_insert = false;
      preselect = false;
    };
  };

}
