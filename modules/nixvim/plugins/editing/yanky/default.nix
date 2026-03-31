# yanky.nvim - 剪贴板历史管理插件 (Yank history ring)，
# 记录所有 yank/delete 操作历史，支持在历史记录中浏览和粘贴，
# 使用 SQLite 持久化存储，支持与系统剪贴板同步
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
  plugins.sqlite-lua.enable = true;
  plugins.yanky = {
    enable = true;
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
      system_clipboard = {
        sync_with_ring = false;
      };
    };
  };
}
