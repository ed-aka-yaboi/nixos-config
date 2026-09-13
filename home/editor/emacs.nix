{ pkgs, config, ... }:
{
  home =
    let
      npmGlobal = "${config.home.homeDirectory}/.npm-global";
      # needed to build some lisp packages add ons
      extraLibPaths = pkgs.lib.makeLibraryPath [
        pkgs.openssl
      ];
    in
    {
      # allow `npm install -g` to install into ~/.npm-global without sudo/nix
      sessionVariables = {
        NPM_CONFIG_PREFIX = npmGlobal;
        LD_LIBRARY_PATH = extraLibPaths;
      };
      sessionPath = [ "${npmGlobal}/bin" ];

      packages = with pkgs; [
        editorconfig-core-c
        multimarkdown
        nodejs
        pkg-config
        shellcheck
        shfmt
      ];
    };
}
