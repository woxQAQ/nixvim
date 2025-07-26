{ lib, pkgs, ... }:
{
  bicep.command = lib.getExe pkgs.bicep;
  biome = {
    command = lib.getExe pkgs.biome;
    env = {
      BIOME_CONFIG_PATH = pkgs.writeTextFile {
        name = "biome.json";
        text = lib.generators.toJSON { } {
          "$schema" = "${pkgs.biome}/node_modules/@biomejs/biome/configuration_schema.json";
          formatter.useEditorconfig = true;
        };
      };
    };
  };
  black.command = lib.getExe pkgs.black;
  cmake-format.command = lib.getExe pkgs.cmake-format;
  csharpier.command = lib.getExe pkgs.csharpier;
  deno_fmt.command = lib.getExe pkgs.deno;
  fantomas.command = lib.getExe pkgs.fantomas;
  gdformat.command = lib.getExe' pkgs.gdtoolkit_4 "gdformat";
  golines.command = lib.getExe pkgs.golines;
  google-java-format.command = lib.getExe pkgs.google-java-format;
  isort.command = lib.getExe pkgs.isort;
  jq.command = lib.getExe pkgs.jq;
  kdlfmt.command = lib.getExe pkgs.kdlfmt;
  nixfmt.command = lib.getExe pkgs.nixfmt;
  prettierd.command = lib.getExe pkgs.prettierd;
  ruff.command = lib.getExe pkgs.ruff;
  rustfmt.command = lib.getExe pkgs.rustfmt;
  shellcheck.command = lib.getExe pkgs.shellcheck;
  shellharden.command = lib.getExe pkgs.shellharden;
  shfmt.command = lib.getExe pkgs.shfmt;
  sqlfluff.command = lib.getExe pkgs.sqlfluff;
  squeeze_blanks.command = lib.getExe' pkgs.coreutils "cat";
  stylelint.command = lib.getExe pkgs.stylelint;
  stylua.command = lib.getExe pkgs.stylua;
  swift_format.command = lib.getExe pkgs.swift-format;
  taplo.command = lib.getExe pkgs.taplo;
  terraform_fmt.command = lib.getExe pkgs.terraform;
  xmlformat.command = lib.getExe pkgs.xmlformat;
  yamlfmt.command = lib.getExe pkgs.yamlfmt;
  zigfmt.command = lib.getExe pkgs.zig;
}
