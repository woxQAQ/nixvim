.PHONY: bump fmt check run
bump:
	nix flake update
fmt:
	nix fmt
check:
	nix flake check
run:
	nix run
