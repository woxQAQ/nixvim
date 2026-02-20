{ config, lib, ... }:
{
  plugins = {
    refactoring = {
      enable = true;
      enableTelescope = config.plugins.telescope.enable;

      settings = {
        # Prompt for return types in languages that support it
        prompt_func_return_type = {
          go = true;
          cpp = true;
          c = true;
          java = true;
        };

        # Prompt for function parameter types
        prompt_func_param_type = {
          go = true;
          cpp = true;
          c = true;
          java = true;
        };

        # Custom printf statements for debugging (function entry/exit)
        printf_statements = import ./printf.nix;

        # Custom print var statements (variable name and value)
        print_var_statements = import ./print_var.nix;
      };
    };

    which-key.settings.spec = lib.optionals config.plugins.refactoring.enable [
      {
        __unkeyed-1 = "<leader>r";
        mode = [
          "n"
          "x"
        ];
        group = "Refactor";
        icon = " ";
      }
    ];
  };

  keymaps = import ./keymaps.nix;
}
