[
  {
    action.__raw = ''
      function()
        require("conform").format{lsp_fallback=true}
      end
    '';
    key = "<leader>cf";
    options = {
      silent = true;
      desc = "Format buffer";
    };
  }
]
