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
          ".config/rpcs3/test.yml" = {
            text = ''
              {}
            '';
          };
        };
      };
    };
  }
