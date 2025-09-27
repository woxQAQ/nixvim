.PHONY: bump fmt check run
bump:
	nix flake update --extra-experimental-features "flakes nix-command"
fmt:
	nix fmt
check:
	nix flake check --extra-experimental-features "flakes nix-command"
run:
	nix run --extra-experimental-features "flakes nix-command"
