{
  config,
  lib,
  ...
}:
let
  inherit (lib) mkIf optionals hasAttr;
  inherit (lib.nixvim) mkRaw;
  inherit (config.plugins)
    typescript-tools
    conform-nvim
    glance
    fzf-lua
    snacks
    lsp
    ;
in
{
  imports = [
    ./lsp/helm.nix
    ./lsp/lspconfig.nix
    ./lsp/nixd.nix
  ];
  lsp = {
    inlayHints.enable = true;
    servers = {
      "*" = {
        settings.capabilities = {
          textDocument.semanticTokens.multilineTokenSupport = true;
          root_markers = [
            ".git"
          ];
        };
      };
      biome.enable = true;
      cssls.enable = true;
      dockerls.enable = true;
      gopls = {
        enable = true;
      };
      html.enable = true;
      jsonls.enable = true;
      lua_ls.enable = true;
      marksman.enable = true;
      nixd.enable = true;
      nushell.enable = true;
      ruff.enable = true;
      statix.enable = true;
      stylelint_lsp.enable = true;
      taplo.enable = true;
      pyright.enable = true;
      tailwindcss.enable = true;
      ts_ls.enable = !typescript-tools.enable;
      yamlls.enable = true;
    };
  };
  plugins = {
    lsp-format.enable = !conform-nvim.enable && lsp.enable;
    lsp-signature.enable = lsp.enable;
    # which-key.settings.spec = [
    #   { }
    # ];
  };
  keymapsOnEvents.LspAttach =
    optionals (!conform-nvim.enable) [
      {
        action.__raw = ''vim.lsp.buf.format'';
        mode = "v";
        key = "<leader>cf";
        options = {
          silent = true;
          buffer = false;
          desc = "format selection";
        };
      }
    ]
    ++ [

      {
        mode = "n";
        key = "<leader>lH";
        action = mkRaw "vim.diagnostic.open_float";
        options = {
          silent = true;
          desc = "Lsp diagnostic open float";
        };
      }
    ]
    ++ optionals (!glance.enable) [
      {
        action = "<CMD>PeekDefinition textDocument/definition<CR>";
        mode = "n";
        key = "<leader>lp";
        options = {
          desc = "Preview definitions";
        };
      }
      {
        action = "<CMD>PeekDefinition textDocument/typeDefinitions<CR>";
        mode = "n";
        key = "<leader>lP";
        options = {
          desc = "Preview type definitions";
        };
      }
    ]
    ++ optionals (!conform-nvim.enable) [
      {
        key = "<leader>cf";
        mode = "n";
        action = mkRaw "vim.lsp.buf.format";
        options = {
          silent = true;
          desc = "Lsp buf format";
        };
      }
    ]
    ++ optionals (!fzf-lua.enable || (snacks.enable && hasAttr "picker" snacks.settings)) [
      {
        key = "<leader>ca";
        mode = "n";
        action = mkRaw "vim.lsp.buf.code_action";
        options = {
          silent = true;
          desc = "Lsp buf code_action";
        };
      }
    ];
}
