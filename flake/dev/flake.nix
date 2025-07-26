{
  description = "";
  inputs = {
    root.url = "path:../../";
    nixpkgs.follow = "root/nixpkgs";
    git-hook-nix = {
      url = "github:cachix/git-hooks.nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        gitignores.follows = "";
        flake-compat.follows = "";
      };
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = _inputs: { };
}
