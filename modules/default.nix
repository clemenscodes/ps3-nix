{
  inputs,
  lib,
  pkgs,
  system,
  ...
}: {...}: {
  imports = [(import ./playstation3 {inherit inputs lib pkgs system;})];
}
