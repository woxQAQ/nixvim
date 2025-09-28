{
  plugins.markview =
    let
      filetypes = [
        "latex"
        "markdown"
        "md"
      ];
    in
    {
      enable = true;

      lazyLoad.settings.ft = filetypes;

      settings = {
        preview = {
          inherit filetypes;

          ignore_buftypes = [ ];

          condition.__raw = ''
            function (buffer)
               local ft, bt = vim.bo[buffer].ft, vim.bo[buffer].bt;

               if bt == "nofile" and (ft == "Avante" or ft == "codecompanion") then
                    return true;
               elseif bt == "nofile" then
                    return false;
               else
                    return true;
               end
            end
          '';
        };
      };
    };

  keymaps = import ./keymaps.nix;
}
