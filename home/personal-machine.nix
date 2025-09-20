{ pkgs, ... }:

{
  imports = [
    ./discord.nix
    ./pentesting.nix
    ./wm/hyprland
    ./rofi
  ];

  home = {
    packages = with pkgs; [
      anki
      bashmount
      brightnessctl
      chromium
      firefox
      hugo
      libreoffice-qt6-fresh
      obsidian
      pamixer
      quickemu # ez vm setup
      rofi-bluetooth
      slack
      steam
      vhs
      xournalpp
      xsel
      zoom-us
    ];
  };
}
