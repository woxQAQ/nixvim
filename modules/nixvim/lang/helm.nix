{
  autoCmd = [
    {
      event = "FileType";
      pattern = "helm";
      command = "LspRestart";
    }
  ];
  lsp.servers.helm_ls.enable = true;
  plugins.helm.enable = true;
}
