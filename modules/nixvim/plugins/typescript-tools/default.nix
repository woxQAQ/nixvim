{ pkgs, ... }:
{
  plugins.typescript-tools = {
    enable = true;
    lazyLoad.settings.ft = [
      "typescript"
      "javascript"
      "typescriptreact"
      "javascriptreact"
    ];
    settings.settings = {
      tsserver_path = "${pkgs.typescript}/lib/node_modules/typescript/lib/tsserver.js";
      code_lens = "off";
      expose_as_code_action = "all";
      include_completions_with_insert_text = true;
      separate_diagnostic_server = true;
    };
  };
}
