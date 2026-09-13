{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ (discord.override { withOpenASAR = true; }) ];
  xdg.configFile."discord/settings.json".text = ''
    {
      "SKIP_HOST_UPDATE": true
    }
  '';
}
