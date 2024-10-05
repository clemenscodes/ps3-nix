{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
  };
  outputs = inputs:
    with inputs;
      flake-parts.lib.mkFlake {inherit inputs;} {
        systems = [
          "x86_64-linux"
          "aarch64-linux"
        ];
        perSystem = {
          pkgs,
          system,
          ...
        }: let
          inherit (pkgs) lib;
        in {
          formatter = pkgs.alejandra;
          nixosModules = {
            default = import ./modules {inherit inputs lib pkgs;};
          };
        };
      };
}
