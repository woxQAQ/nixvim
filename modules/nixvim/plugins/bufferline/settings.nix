{ ... }:
let
  mouse = {
    right = # lua
      "'vertical sbuffer %d'";
    close = # lua
      ''
        function(bufnum)
          require("mini.bufremove").delete(bufnum)
        end
      '';
  };
in
{
  mode = "buffers";
  always_show_bufferline = true;
  buffer_close_icon = "󰅖";
  close_command.__raw = mouse.close;
  close_icon = "";
  diagnostics = "nvim_lsp";
  diagnostics_indicator = ''
    function(count, level, diagnostics_dict, context)
      local s = ""
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
          or (e == "warning" and " " or "" )
        if(sym ~= "") then
          s = s .. " " .. n .. sym
        end
      end
      return s
    end
  '';
  enforce_regular_tabs = false;
  groups = {
    imports = [ ./group.nix ];
  };
  indicator = {
    style = "icon";
    icon = "▎";
  };

  left_trunc_marker = "";
  max_name_length = 18;
  max_prefix_length = 15;
  modified_icon = "●";

  numbers.__raw = ''
    function(opts)
      return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
    end
  '';
  persist_buffer_sort = true;
  right_mouse_command.__raw = mouse.right;
  right_trunc_marker = "";
  separator_style = "slant";
  show_buffer_close_icons = true;
  show_buffer_icons = true;
  show_close_icon = true;
  show_tab_indicators = true;
  sort_by = "extension";
  tab_size = 18;

  offsets = [
    {
      filetype = "neo-tree";
      text = "File Explorer";
      text_align = "center";
      highlight = "Directory";
    }
  ];
}
