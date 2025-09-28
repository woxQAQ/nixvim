let
  keymaps = import ./keymaps.nix;
  yankyLazyKeys = map (keymap: {
    __unkeyed-1 = keymap.key;
    __unkeyed-2 = keymap.action;
    mode = keymap.mode or "n";
    inherit (keymap.options) desc;
  }) keymaps;
in
{
  plugins.yanky = {
    enable = true;
  };
  lazyLoad = {
    settings = {
      keys = yankyLazyKeys;
    };
  };
  settings = {
    ring = {
      history_length = 10;
      storage = "sqlite";
      storage_path.__raw = "vim.fn.stdpath('data') .. '/databases/yanky.db'";
      sync_with_numbered_registers = true;
      cancel_event = "update";
      ignore_registers = [ "_" ];
      update_register_on_cycle = false;
    };
  };
}
