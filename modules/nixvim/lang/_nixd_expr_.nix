{
  self,
  system ? builtins.currentSystem,
}:
let
  inherit (builtins)
    isString
    filter
    split
    concatStringsSep
    readDir
    length
    genList
    elemAt
    getEnv
    ;
  dropLast =
    list:
    let
      len = length list;
      last = genList (elemAt list) (len - 1);
    in
    if list == [ ] || len == 1 then [ ] else last;
  ispart = part: isString part && part != "" && part != ".";
  getParts = dir: filter ispart (split "/+" dir);
  findFlake' =
    parts:
    let
      dir = "/" + concatStringsSep "/" parts;
      files = readDir dir;
      isFlake = files."flake.nix" or null == "regular";
      parent = dropLast parts;
    in
    if parts == [ ] then
      null
    else if isFlake then
      dir
    else
      findFlake' parent;
  findFlake = dir: findFlake' (getParts dir);
  pwd = getEnv "PWD";
  path = findFlake pwd;
in
{
  inherit system self path;
  local = if path == null then null else builtins.getFlake path;
  global = builtins.getFlake self;
}
