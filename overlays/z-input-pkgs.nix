{ flake }:
_final: prev:
  (import ./input-pkgs.nix { inherit flake; }) _final prev
  # preserving overlay precedence (this file is alphabetically later).
