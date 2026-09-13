{ pkgs, ... }: {
  home.packages = with pkgs; [
    beamPackages.erlang
    erlfmt
    erlang-language-platform
    rebar3
  ];
}
