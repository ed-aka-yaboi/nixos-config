{ pkgs, config, ... }:
{
  home =
    let
      npmGlobal = "${config.home.homeDirectory}/.npm-global";
    in
    {
      # allow `npm install -g` to install into ~/.npm-global without sudo/nix
      sessionVariables.NPM_CONFIG_PREFIX = npmGlobal;
      sessionPath = [ "${npmGlobal}/bin" ];

      packages = with pkgs; [
        autoconf
        editorconfig-core-c
        gtk3
        libgccjit
        librsvg
        libwebp
        multimarkdown
        nodejs
        pkg-config
        shellcheck
        shfmt
        source-code-pro # spacemacs font
        sqlite.dev
      ];
    };
}
