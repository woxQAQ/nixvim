{ pkgs, ... }:
{
  lsp.servers = {
    vtsls = {
      enable = true;
      config = {
        filetypes = [
          "javascript"
          "javascriptreact"
          "typescript"
          "typescriptreact"
          "vue"
        ];
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = [
                {
                  name = "@vue/typescript-plugin";
                  location = "${pkgs.vue-language-server}/lib/node_modules/@vue/language-server";
                  languages = [ "vue" ];
                  configNamespace = "typescript";
                }
              ];
            };
          };
          typescript = {
            tsdk = "${pkgs.typescript}/lib/node_modules/typescript/lib";
          };
        };
      };
    };
    vue_ls.enable = true;
  };
}
