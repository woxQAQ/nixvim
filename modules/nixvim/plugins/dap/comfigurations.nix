{
  lib,
  pkgs,
  config,
  ...
}:
let
  program.__raw = ''
    function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/', "file")
    end
  '';

  codelldb-config = {
    inherit program;
    name = "Launch (CodeLLDB)";
    type = "codelldb";
    request = "launch";
    cwd = ''''${workspaceFolder}'';
    stopOnEntry = false;
  };

  gdb-config = {
    inherit program;
    name = "Launch (GDB)";
    type = "gdb";
    request = "launch";
    cwd = ''''${workspaceFolder}'';
    stopOnEntry = false;
  };

  lldb-config = {
    inherit program;
    name = "Launch (LLDB)";
    type = "lldb";
    request = "launch";
    cwd = ''''${workspaceFolder}'';
    stopOnEntry = false;
  };
in
{

}
