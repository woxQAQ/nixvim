
nix --extra-experimental-features "flakes nix-command" eval --expr '(builtins.getFlake (builtins.toString ./.) ).outputs'
