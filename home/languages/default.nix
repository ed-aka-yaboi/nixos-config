{ pkgs, bqnlsp, ... }: {
  imports = [
    ./cpp.nix
    # ./elixir.nix
    ./erlang.nix
    ./go.nix
    ./rust.nix
    # issues w work node setup I need to fix
    # ./web-dev.nix
  ];

  home.packages = with pkgs; [
    (bqnlsp.defaultPackage.${pkgs.system})
    chez
    chez-mit
    akku
    bqn386
    cbqn
    sbcl
    spin
    rabbitmq-c
    flatbuffers
    typescript
    nodePackages.prettier
    pyright
  ];
}
