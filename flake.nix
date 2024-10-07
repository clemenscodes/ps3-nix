{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    rpcs3 = {
      url = "github:clemenscodes/rpcs3";
    };
  };

  outputs = {
    nixpkgs,
    flake-parts,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    inherit (pkgs) lib;
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
      ];
      flake = {
        homeManagerModules = {
          default = import ./modules {inherit inputs lib pkgs system;};
        };
      };
      perSystem = {...}: {
        formatter = pkgs.alejandra;
      };
    };
}
