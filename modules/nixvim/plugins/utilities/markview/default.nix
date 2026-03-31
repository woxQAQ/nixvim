# markview.nvim - Markdown 富文本渲染插件，
# 直接在 Neovim buffer 中渲染 Markdown 的标题、列表、表格、
# 代码块等元素，提供接近所见即所得的编辑体验，
# 同时支持 Avante、LaTeX、Org 等文件类型
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
