{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.programs.miriconf;
  kclockPkg = pkgs.libsForQt5.miriconf;
in {
  options.programs.miriconf = { enable = mkEnableOption (lib.mdDoc "miriconf"); };

  config = mkIf cfg.enable {
    services.dbus.packages = [ kclockPkg ];
    environment.systemPackages = [ kclockPkg ];
  };
}