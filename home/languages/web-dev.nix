{ pkgs, ... }:
let
  node_pkgs = with pkgs; [
    svelte-check
    typescript-language-server
  ];
in
{
  home.packages = with pkgs; [
    tree-sitter-grammars.tree-sitter-svelte
    yarn
  ] ++ node_pkgs;
}

