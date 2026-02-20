{
  bash = [
    "shellcheck"
    "shellharden"
    "shfmt"
  ];
  c = [ "clang_format" ];
  # cmake = [ "cmake-format" ];
  cpp = [ "clang_format" ];
  css = [ "stylelint" ];
  go = [ "golines" ];
  javascript = {
    __unkeyed-1 = "prettierd";
    __unkeyed-2 = "biome";
    timeout_ms = 2000;
    stop_after_first = true;
  };
  json = [ "jq" ];
  html = [ "prettierd" ];
  lua = [ "stylua" ];
  markdown = [ "deno_fmt" ];
  nix = [ "nixfmt" ];
  python = [
    "ruff"
  ];
  rust = [ "rustfmt" ];
  sh = [
    "shellcheck"
    "shellharden"
    "shfmt"
  ];
  sql = [ "sqlfluff" ];
  terraform = [ "terraform_fmt" ];
  toml = [ "taplo" ];
  typescript = {
    __unkeyed-1 = "prettierd";
    __unkeyed-2 = "biome";
    timeout_ms = 2000;
    stop_after_first = true;
  };
  xml = [
    "xmlformat"
    "xmllint"
  ];
  yaml = [ "yamlfmt" ];
  "_" = [
    "squeeze_blanks"
    "trim_whitespace"
    "trim_newlines"
  ];
}
