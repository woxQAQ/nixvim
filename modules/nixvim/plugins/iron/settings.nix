{ lib, pkgs, ... }:
{
  scratch_repl = true;
  repl_definition = {
    python = {
      command = [ "${lib.getExe pkgs.python3}" ];
      format.__raw = ''
        require("iron.fts.common").bracketed_paste_python
      '';
    };
    nix = {
      command = [
        "nix"
        "repl"
      ];
    };
  };
  keymaps = {
    send_motion = "<leader>im";
    visual_send = "<leader>iv";
    send_file = "<leader>if";
    send_line = "<leader>il";
    send_paragraph = "<leader>ip";
    send_until_cursor = "<leader>iu";
    send_mark = "<leader>is";
    mark_motion = "<leader>ic";
    mark_visual = "<leader>ic";
    remove_mark = "<leader>id";
    cr = "<leader>i<cr>";
    interrupt = "<leader>i<space>";
    exit = "<leader>iq";
    clear = "<leader>iC";
  };
  highlight = {
    italic = true;
  };
  ignore_blank_lines = true;
}
