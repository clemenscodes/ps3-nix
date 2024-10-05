{
  inputs,
  lib,
  pkgs,
  system,
  ...
}: {...}: {
  imports = [(import ./rpcs3 {inherit inputs lib pkgs system;})];
}
