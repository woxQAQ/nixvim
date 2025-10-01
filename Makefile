NIX_FLAG = --extra-experimental-features "flakes nix-command"
NIX = nix $(NIX_FLAG)

.PHONY: bump fmt check run
bump:
	$(NIX) flake update

fmt:
	$(NIX) fmt

check: fmt
	$(NIX) flake check
run:
	$(NIX) run
repl:
	$(NIX) repl
eval:
	$(NIX) eval
