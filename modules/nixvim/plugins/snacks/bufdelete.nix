{
  config,
  lib,
  ...
}:
{
  extraConfigLuaPre =
    lib.mkIf (config.plugins.snacks.enable && lib.hasAttr "bufdelete" config.plugins.snacks.settings) # Lua
      ''
        -- Disable built-in diagnostic keymaps that conflict with <C-W> closing a buffer
        vim.keymap.del('n', '<C-W>d')
        vim.keymap.del('n', '<C-W><C-D>')
      '';

  plugins.snacks.settings = {
    bufdelete.enabled = true;
  };
  imports = [ ./keymaps/bufdelete.nix ];
}
