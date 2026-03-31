# typescript-tools.nvim - TypeScript/JavaScript 的 LSP 增强插件，
# 使用独立于 tsserver 的方式提供更快的类型检查和代码操作，
# 替代 tsserver 直接使用，减少内存占用并提升响应速度
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
      code_lens = "off";
      complete_function_calls = false;
      disable_member_code_lens = true;
      expose_as_code_action = "all";
      include_completions_with_insert_text = true;
      publish_diagnostic_on = "insert_leave";
      separate_diagnostic_server = true;
      tsserver_locale = "en";
      tsserver_max_memory = "auto";
      tsserver_path = "${pkgs.typescript}/lib/node_modules/typescript/lib/tsserver.js";
      jsx_close_tag = {
        enable = false;
        filetypes = [
          "javascriptreact"
          "typescriptreact"
        ];
      };
    };
  };
}
