{ config, pkgs, lib, ... }:

let
  tuigreet = lib.getExe pkgs.tuigreet;
  uwsm = lib.getExe pkgs.uwsm;
  session = "hyprland-uwsm.desktop";
  sessionCommand = lib.escapeShellArgs [ uwsm "start" session ];
  tuigreetCommand = lib.escapeShellArgs [
    tuigreet
    "--greeting" "Ave ave cum ave!"
    "--asterisks"
    "--remember"
    "--remember-user-session"
    "--time"
    "--sessions" "/run/current-system/sw/share/wayland-sessions"
    "--xsessions" "/run/current-system/sw/share/xsessions"
    "--cmd" sessionCommand
  ];
in
{
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        inherit (config) user;
        command = sessionCommand;
      };
      default_session = {
        command = tuigreetCommand;
        user = "greeter";
      };
    };
  };
}
