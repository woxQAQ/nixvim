{
  description = "dev flake";
  inputs = {
    root.url = "path:../..";
    nixpkgs.follows = "root/nixpkgs";
    git-hooks-nix = {
      url = "github:cachix/git-hooks.nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        gitignore.follows = "";
        flake-compat.follows = "";
      };
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = _: { };
}
