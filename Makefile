OS := $(shell uname)
SYSTEM := $(shell echo "$$(uname -m)-$$(uname | tr '[:upper:]' '[:lower:]')")

ifeq ($(OS),Darwin)
	NIX_FLAG = --extra-experimental-features "flakes nix-command"
	NIX = nix $(NIX_FLAG)
else
	NIX = nix
endif

.PHONY: bump fmt check run
bump:
	$(NIX) flake update

fmt:
	@$(NIX) fmt

ci:
	$(NIX) build .#checks.$(SYSTEM).treefmt

check: fmt
	$(NIX) flake check
run:
	$(NIX) run
repl:
	$(NIX) repl
eval:
	$(NIX) eval
