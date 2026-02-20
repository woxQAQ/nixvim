{
  default_integrations = true;
  dim_inactive = {
    enabled = false;
    percentage = 0.25;
  };

  flavour = "macchiato";
  integrations = import ./integrations.nix;
  show_end_of_buffer = true;
  term_colors = true;
  transparent_background = true;
}
