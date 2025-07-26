{ ... }:
{
  imports = [ ./keymaps/map.nix ];
  plugins.mini.modules.map = {
    # __raw = lua code
    # __unkeyed-1.* = no key, just the value
    integrations = {
      "__unkeyed-1.builtin_search".__raw = "require('mini.map').gen_integration.builtin_search()";
      "__unkeyed-2.gitsigns".__raw = "require('mini.map').gen_integration.gitsigns()";
      "__unkeyed-3.diagnostic".__raw = "require('mini.map').gen_integration.diagnostic()";
    };

    window = {
      winblend = 0;
    };
  };
}
