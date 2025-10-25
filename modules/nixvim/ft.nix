{
  filetype = {
    extension = {
      avsc = "json";
      rasi = "scss";
      ignore = "gitignore";
    };

    pattern = {
      ".*/waybar/style.css" = "less";
      ".*/hypr/.*%.conf" = "hyprlang";
      "flake.lock" = "json";
      ".*helm-chart*.yaml" = "helm";
    };
  };
}
