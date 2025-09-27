NIX_FLAG = --extra-experimental-features "flakes nix-command"
.PHONY: bump fmt check run
bump:
	nix flake update $(NIX_FLAG)

fmt:
	nix fmt $(NIX_FLAG)

check: fmt
	nix flake check $(NIX_FLAG)
run:
	nix run $(NIX_FLAG)
