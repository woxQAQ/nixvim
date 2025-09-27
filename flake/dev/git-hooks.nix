{ inputs, ... }:
{
  imports = [
    inputs.git-hooks.flakeModule
  ];
  perSystem =
    { pkgs, ... }:
    {
      pre-commit = {
        check.enable = true;
        settings.excludes = [ "flake.lock" ];

        settings.hooks = {
          # keep-sorted start block=yes
          actionlint = {
            enable = true;
            package = pkgs.actionlint;
          };
          deadnix = {
            enable = true;
            package = pkgs.deadnix;
            settings = {
              edit = true;
            };
          };
          statix = {
            enable = true;
            package = pkgs.statix;
          };
          # keep-sorted end
        };
      };
    };
}
