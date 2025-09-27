{
  imports = [
    ./lang/helm.nix
    ./lang/nixd.nix
  ];
  opts = {
    foldcolumn = "1";
    foldlevel = 99;
    foldlevelstart = -1;
    foldenable = true;
  };

  plugins.lspconfig.enable = true;
  plugins.lsp-signature.enable = true;

  lsp = {
    inlayHints.enable = true;
    servers = {
      "*" = {
        settings = {
          capabilities.textDocuments.semanticTokens.multilineTokenSupport = true;
          root_markers = [ ".git" ];
        };
      };
      # keep-sorted start
      bashls.enable = true;
      biome.enable = true;
      cssls.enable = true;
      dockerls.enable = true;
      gopls.enable = true;
      html.enable = true;
      protols.enable = true;
      jsonls.enable = true;
      nushell.enable = true;
      marksman.enable = true;
      sqls.enable = true;
      lua_ls.enable = true;
      pyright.enable = true;
      ruff.enable = true;
      statix.enable = true;
      yamlls.enable = true;
      taplo.enable = true;
      stylelint_lsp.enable = true;
      tailwindcss.enable = true;
      ts_ls.enable = true;
      # keep-sorted end
    };
  };
}
