{
  bash = [ "shellcheck" ];
  c = [ "clangtidy" ];
  cmake = [ "cmakelint" ];
  cpp = [ "clangtidy" ];
  gdscript = [ "gdlint" ];
  # go = [ "golangcilint" ];
  html = [ "htmlhint" ];
  java = [ "checkstyle" ];
  json = [ "jsonlint" ];
  lua = [ "luacheck" ];
  make = [ "checkmake" ];
  markdown = [ "markdownlint" ];
  nix = [
    "deadnix"
  ];
  rust = [ "clippy" ];
  sh = [ "shellcheck" ];
  sql = [ "sqlfluff" ];
  yaml = [ "yamllint" ];
}
