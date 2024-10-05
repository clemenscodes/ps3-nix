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
        packages = {
          game = import ./modules/playstation3/uncharted-reloaded/game.nix {
            inherit pkgs;
            iso = /mnt/games/uncharted-3-drakes-deception-game-of-the-year-edition-bcus-99086/Uncharted_3_GOTY_BCUS99086_.iso;
          };
        };
      };
    };
}
