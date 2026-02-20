{
  plugins.markview =
    let
      filetypes = [
        "Avante"
        "codecompanion"
        "latex"
        "markdown"
        "md"
        "norg"
        "org"
        "quarto"
        "rmd"
        "typst"
        "vimwiki"
      ];
    in
    {
      enable = true;

      lazyLoad.settings = {
        cmd = "Markview";
        ft = filetypes;
      };

      settings = {
        preview = {
          inherit filetypes;
          icon_privider = "mini";

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
