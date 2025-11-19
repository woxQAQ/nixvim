{ pkgs, lib, ... }:
{
  env = lib.optionalAttrs pkgs.stdenv.isDarwin {
    PUPPETEER_EXECUTABLE_PATH = "/Applications/Chromium.app/Contents/MacOS/Chromium";
  };

  extraPackages = with pkgs; [
    imagemagick
    ghostscript
    typst
    tectonic
  ];

  plugins.snacks.settings = {
    image = {
      enabled = true;
      doc = {
        enabled = true;
        inline = true;
        float = true;
        max_width = 100;
        max_height = 50;
      };
    };
  };
}
