{
  inputs,
  lib,
  pkgs,
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
          default = pkgs.rpcs3;
        };
      };
    };
    config = mkIf (cfg.enable) {
      environment = {
        systemPackages = [cfg.package];
      };
    };
  }
