{
  inputs,
  lib,
  pkgs,
  ...
}: {...}: {
  imports = [(import ./rpcs3 {inherit inputs lib pkgs;})];
}
