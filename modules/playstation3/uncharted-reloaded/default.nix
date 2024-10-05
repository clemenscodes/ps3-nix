{
  inputs,
  lib,
  pkgs,
  system,
  ...
}:
with lib;
  {config, ...}: let
    cfg = config.playstation3.uncharted-reloaded;
    iso = /mnt/games/uncharted-3-drakes-deception-game-of-the-year-edition-bcus-99086/Uncharted_3_GOTY_BCUS99086_.iso;
    game = import ./game.nix {inherit pkgs iso;};
  in {
    options = {
      playstation3 = {
        uncharted-reloaded = {
          enable = mkEnableOption "Enable settings in RPCS3 for Uncharted Reloaded" // {default = false;};
          iso = mkOption {
            type = types.package;
            default = null;
            description = "The Uncharted 3 ISO to be used for RPCS3";
          };
        };
      };
    };
    config = mkIf (cfg.enable) {
      home = {
        file = {
          ".config/rpcs3/games/u3/" = {
            source = game;
          };
        };
      };
    };
  }
