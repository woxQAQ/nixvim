{ lib, pkgs, ... }:
{
  biomejs.cmd = lib.getExe pkgs.biome;
  checkmake.cmd = lib.getExe pkgs.checkmake;
  checkstyle.cmd = lib.getExe pkgs.checkstyle;
  clangtidy.cmd = lib.getExe' pkgs.clang-tools "clang-tidy";
  clippy.cmd = lib.getExe pkgs.rust-analyzer;
  deadnix.cmd = lib.getExe pkgs.deadnix;
  # golangcilint = {
  #   cmd = lib.getExe pkgs.golangci-lint;
  #   args = [
  #     "-v"
  #   ];
  # };
  htmlhint.cmd = lib.getExe pkgs.htmlhint;
  # jsonlint.cmd = lib.getExe pkgs.nodePackages.jsonlint;
  luacheck.cmd = lib.getExe pkgs.luaPackages.luacheck;
  markdownlint.cmd = lib.getExe pkgs.markdownlint-cli;
  nix.cmd = lib.getExe' pkgs.nix "nix-instantiate";
  shellcheck.cmd = lib.getExe pkgs.shellcheck;
  sqlfluff.cmd = lib.getExe pkgs.sqlfluff;
  statix.cmd = lib.getExe pkgs.statix;
  stylelint.cmd = lib.getExe pkgs.stylelint;
  yamllint.cmd = lib.getExe pkgs.yamllint;
}
