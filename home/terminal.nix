{ config, pkgs, lib, ... }:

let
  OS-specific-services = with pkgs.stdenv;
    if isLinux then {
      gpg-agent = {
        enable = true;
        defaultCacheTtl = 1800;
        enableSshSupport = true;
      };
    } else { };
in
{
  imports = [
    ./starship_settings.nix
    ./ghostty.nix
    ./editor
    ./languages
  ];

  home.packages = with pkgs; [
    bat
    claude-code
    codex
    comma
    dig
    direnv
    dust
    fd
    file
    grc
    helix
    htop-vim
    inetutils
    jq
    libiconvReal
    mutt
    parallel
    podman
    pup
    python3
    qemu
    ripgrep
    sd
    starship
    termshark
    tldr
    tree
    unzip
    uv
    wget
    wireshark
    zip
    blesh
  ];

  home.sessionVariables = {
    "SHELL" = "bash";
  };

  programs = {
    zathura = {
      enable = true;
      options = {
        "zoom-step" = 20;
        "scroll-step" = 80;

        "selection-clipboard" = "clipboard";
        "incremental-search" = "true";
      };
    };
    command-not-found.enable = false;
    nix-index = {
      enable = true;
      enableBashIntegration = true;
    };
    starship = {
      enable = true;
    };
    git = {
      enable = true;
      lfs.enable = true;
      signing = {
        format = "openpgp";
      };
      settings = {
        user.email = lib.mkIf (config ? email) config.email;
        add.interactive.useBuiltin = false;
        merge.conflictstyle = "diff3";
        diff.tool = "delta";
        diff.colorMoved = "default";
        init.defaultBranch = "master";
        alias = {
          s = "status";
          d = "diff";
        };
      };
    };
    delta = {
      enable = true;
      enableGitIntegration = true;
      options = { navigate = true; light = false; };
    };
    gpg = {
      enable = true;
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    fzf = {
      enable = true;
      enableBashIntegration = true;
      tmux.enableShellIntegration = true;
    };
    skim = {
      enable = true;
    };
    eza = {
      enable = true;
      enableBashIntegration = true;
      icons = "auto";
      git = true;
    };
    bash = {
      enable = true;
      shellAliases = {
        bm = "bashmount";
        mv = "mv -i";
        lg = "lazygit";
        e = "$EDITOR";
      };
      initExtra = ''
        source ${pkgs.blesh}/share/blesh/ble.sh
        bleopt prompt_ruler=

_greetings=("(⚈∇⚈ )" "(✿╹◡╹)" "/ᐠ. ᴗ.ᐟ\\" "/ᐠ.ꞈ.ᐟ\\" "/ᐠ_ ꞈ _ᐟ\\")
        echo "''${_greetings[$RANDOM % ''${#_greetings[@]}]}"
        unset _greetings

        [[ -f ${pkgs.grc}/etc/grc.sh ]] && source ${pkgs.grc}/etc/grc.sh

        mkPython() {
          cat "${./templates/python_shell.template}" > shell.nix
          echo "use nix" > .envrc
        }
      '';
    };
    zoxide.enable = true;
    broot = {
      enable = true;
    };
    lazygit.enable = true;
    tmux = {
      enable = true;
      clock24 = true;
      shortcut = "a";
      terminal = "screen-256color";
      escapeTime = 0;
      baseIndex = 1;
      sensibleOnTop = true;
      tmuxinator.enable = true;
      plugins = with pkgs.tmuxPlugins; [
        yank
        prefix-highlight
        better-mouse-mode
        extrakto
        pain-control
      ];
    };
  };

  services = OS-specific-services;
}
