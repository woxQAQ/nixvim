# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A Neovim configuration built with [NixVim](https://github.com/nix-community/nixvim) and [flake-parts](https://github.com/hercules-ci/flake-parts). Outputs a single package `woxqaqVim`.

## Commands

```bash
make run       # Build and run the Neovim config
make fmt       # Format all code (nixfmt, deadnix, statix, ruff, keep-sorted)
make check     # Format then run flake checks
make ci        # Build treefmt check artifact
make bump      # Update all flake inputs
make repl      # Open nix repl for the flake
make eval      # Evaluate the flake
```

## Architecture

### Flake structure

```
flake.nix          → entry point, imports ./flake
flake/default.nix  → partitions (dev vs prod), overlays, perSystem pkgs
flake/nixvim.nix   → nixvim flakeModule, woxqaqVim configuration
flake/overlays.nix → custom package overlays
flake/dev/         → dev partition: treefmt, git-hooks, dev-shell
```

The dev partition (`flake/dev/`) is only used for `checks`, `devShells`, and `formatter` outputs. It is separated via `flake-parts` partitions mechanism.

### Module structure

```
modules/nixvim/default.nix     → auto-discovers plugin subdirs + imports core nix files
modules/nixvim/plugins/<cat>/  → auto-discovered by reading directories
modules/woxvim/                → custom NixOS-style options (colortheme, treesitter grammars)
```

### Plugin auto-discovery

Both `modules/nixvim/default.nix` and each `plugins/<category>/default.nix` use the same pattern:

```nix
lib.pipe (builtins.readDir ./.) [
  (lib.filterAttrs (_name: type: type == "directory"))
  lib.attrNames
  (map (name: ./. + "/${name}"))
]
```

To add a new plugin: create a directory under the appropriate category in `plugins/`, add a `default.nix`, and it's automatically imported. No manual registration needed.

### Plugin categories

`ai/` `completion/` `development/` `editing/` `file-management/` `git/` `languages/` `navigation/` `terminal/` `ui/` `utilities/`

### Custom options

`modules/woxvim/options.nix` defines `options.woxVim` with `colortheme` and `treesitter.includedGrammars`. These are used across plugin configs.

### Core config files (non-plugin)

In `modules/nixvim/`: `autocommands.nix`, `color.nix`, `dependencies.nix`, `diagnostics.nix`, `ft.nix`, `keymaps.nix`, `lsp.nix`, `options.nix`, `performance.nix`.

## Formatting and linting

- **nixfmt** with 80-char width (`-w 80`)
- **deadnix** (dead code detection, auto-edit mode)
- **statix** (Nix linting)
- **keep-sorted** (sorted blocks marked with `# keep-sorted start/end`)
- **ruff** (Python format + check)
- **actionlint** (GitHub Actions linting)

Sorted blocks are used extensively throughout the codebase — preserve them when editing.

## Key conventions

- Plugin configs split into `default.nix` (main), `settings.nix` (plugin options), `keymaps.nix` (keybindings) as needed.
- LSP servers configured in `modules/nixvim/lsp.nix` with `plugins.lspconfig` and `lsp.servers`.
- `extraSpecialArgs` passes `inputs`, `system`, and `self` to all NixVim modules.
- Neovim nightly is used via `neovim-nightly-overlay`.
- `nixpkgs.config.allowUnfree = true` is set at both flake and module level.
