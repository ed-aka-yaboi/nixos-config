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
      pamixer
      quickemu # ez vm setup
      rofi-bluetooth
      obsidian
      libreoffice-qt6-fresh
      steam
      vhs
      xsel
      xournalpp
      zoom-us
    ];

  };
}
