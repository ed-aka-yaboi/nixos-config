{ pkgs, ... }: {
  home.packages = with pkgs; [
    erlang
    erlfmt
    erlang-language-platform
    rebar3
  ];
}
