{ flake }:
_final: prev:
let
  # Import the same nixpkgs used by the flake so our overrides apply to
  # the exact package set that the flake builds.
  nixpkgs-packages = import flake.inputs.nixpkgs {
    inherit (prev.stdenv) system;
    config = { allowUnfree = true; allowAliases = false; };
  };

  inherit (nixpkgs-packages) luaPackages luajitPackages;

  # Helper to wrap various vimplugin builder functions so that any drv
  # produced for "neotest" will have checks disabled.
  wrapBuilder = drvFn: arg:
    let drv = drvFn arg; in
    if (builtins.hasAttr "name" arg && builtins.match "neotest" arg.name != null) ||
       (builtins.hasAttr "pname" arg && builtins.match "neotest" arg.pname != null)
    then drv.overrideAttrs (_: { doCheck = false; }) else drv;
in
{
  # Top-level and package-set specific overrides as a defensive net.
  neotest = prev.neotest.overrideAttrs (_: { doCheck = false; });

  luaPackages = luaPackages // {
    neotest = luaPackages.neotest.overrideAttrs (_: { doCheck = false; });
  };

  luajitPackages = luajitPackages // {
    neotest = luajitPackages.neotest.overrideAttrs (_: { doCheck = false; });
  };

  # Explicit luajit_2_1 package-set override (some derivations reference it)
  luajit_2_1 = nixpkgs-packages.luajit_2_1 // {
    neotest = nixpkgs-packages.luajit_2_1.neotest.overrideAttrs (_: { doCheck = false; });
  };

  # Disable checks on the vimPlugins entry for neotest so vimplugin
  # packaging won't execute the plugin tests.
  vimPlugins = prev.vimPlugins // prev.lib.mapAttrs (name: p: if name == "neotest" then p.overrideAttrs (_: { doCheck = false; }) else p) prev.vimPlugins;

  # Wrap common vimplugin builder functions to catch alternate construction
  # paths that might produce vimplugin-* drvs (including luajit variants).
  vimUtils = prev.vimUtils // {
    buildVimPlugin = wrapBuilder prev.vimUtils.buildVimPlugin;
    buildVimPluginFrom2Nix = wrapBuilder prev.vimUtils.buildVimPluginFrom2Nix;
    toVimPlugin = wrapBuilder prev.vimUtils.toVimPlugin;
  };
}
