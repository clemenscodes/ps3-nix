{
  inputs,
  lib,
  pkgs,
  system,
  ...
}:
with lib;
  {config, ...}: let
    cfg = config.playstation3;
    ps3bios = import ./firmware {inherit pkgs;};
  in {
    imports = [
      (import ./uncharted-reloaded {inherit inputs lib pkgs system;})
    ];
    options = {
      playstation3 = {
        enable = mkEnableOption "Enable PlayStation 3 emulation using a modded RPCS3" // {default = false;};
        package = mkOption {
          type = types.package;
          default = inputs.rpcs3.packages.${system}.default;
        };
      };
    };
    config = mkIf (cfg.enable) {
      home = {
        packages = [cfg.package];
        file = {
          ".config/rpcs3/bios" = {
            source = "${ps3bios}/bios";
          };
        };
      };
    };
  }
