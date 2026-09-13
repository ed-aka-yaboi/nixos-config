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
      libreoffice-qt-stable
      obsidian
      pamixer
      quickemu # ez vm setup
      rofi-bluetooth
      slack
      steam
      xournalpp
      xsel
      zoom-us
    ];
  };
}
