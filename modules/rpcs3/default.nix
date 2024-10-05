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
  in {
    imports = [];
    options = {
      playstation3 = {
        enable = mkEnableOption "Enable PlayStation 3 emulation using RPCS3" // {default = false;};
        package = mkOption {
          type = types.package;
          default = inputs.rpcs3.packages.${system}.default;
        };
      };
    };
    config = mkIf (cfg.enable) {
      environment = {
        systemPackages = [cfg.package];
      };
    };
  }
