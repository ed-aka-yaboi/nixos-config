{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    nil # nix lsp
    nixpkgs-fmt # nix formatter
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };

  stylix.targets.helix.enable = false;

  programs.helix = {
    enable = true;
    settings = {
      theme = "nix-theme";
      editor = {
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        file-picker.hidden = false;
        soft-wrap.enable = true;
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
        statusline.left = [ "mode" "spinner" "file-name" "version-control" ];
        cursorline = true;
      };
      keys.normal.esc = [ "collapse_selection" "keep_primary_selection" ];
      keys.insert."\\" = {
        "=" = [ ":insert-output echo -n ×" "move_char_right" ];
        "minus" = [ ":insert-output echo -n ÷" "move_char_right" ];
        "+" = [ ":insert-output echo -n ⋆" "move_char_right" ];
        "_" = [ ":insert-output echo -n √" "move_char_right" ];
        "b" = [ ":insert-output echo -n ⌊" "move_char_right" ];
        "B" = [ ":insert-output echo -n ⌈" "move_char_right" ];
        "t" = [ ":insert-output echo -n ∧" "move_char_right" ];
        "v" = [ ":insert-output echo -n ∨" "move_char_right" ];
        "~" = [ ":insert-output echo -n ¬" "move_char_right" ];
        "<" = [ ":insert-output echo -n ≤" "move_char_right" ];
        ">" = [ ":insert-output echo -n ≥" "move_char_right" ];
        "/" = [ ":insert-output echo -n ≠" "move_char_right" ];
        "m" = [ ":insert-output echo -n ≡" "move_char_right" ];
        "M" = [ ":insert-output echo -n ≢" "move_char_right" ];
        "{" = [ ":insert-output echo -n ⊣" "move_char_right" ];
        "}" = [ ":insert-output echo -n ⊢" "move_char_right" ];
        "z" = [ ":insert-output echo -n ⥊" "move_char_right" ];
        "," = [ ":insert-output echo -n ∾" "move_char_right" ];
        "." = [ ":insert-output echo -n ≍" "move_char_right" ];
        "Z" = [ ":insert-output echo -n ⋈" "move_char_right" ];
        "r" = [ ":insert-output echo -n ↑" "move_char_right" ];
        "c" = [ ":insert-output echo -n ↓" "move_char_right" ];
        "d" = [ ":insert-output echo -n ↕" "move_char_right" ];
        "H" = [ ":insert-output echo -n «" "move_char_right" ];
        "L" = [ ":insert-output echo -n »" "move_char_right" ];
        "q" = [ ":insert-output echo -n ⌽" "move_char_right" ];
        "a" = [ ":insert-output echo -n ⍉" "move_char_right" ];
        "T" = [ ":insert-output echo -n ⍋" "move_char_right" ];
        "V" = [ ":insert-output echo -n ⍒" "move_char_right" ];
        "i" = [ ":insert-output echo -n ⊏" "move_char_right" ];
        "I" = [ ":insert-output echo -n ⊑" "move_char_right" ];
        "o" = [ ":insert-output echo -n ⊐" "move_char_right" ];
        "O" = [ ":insert-output echo -n ⊒" "move_char_right" ];
        "e" = [ ":insert-output echo -n ∊" "move_char_right" ];
        "E" = [ ":insert-output echo -n ⍷" "move_char_right" ];
        "u" = [ ":insert-output echo -n ⊔" "move_char_right" ];
        "(" = [ ":insert-output echo -n ⟨" "move_char_right" ];
        "0" = [ ":insert-output echo -n •" "move_char_right" ];
        ")" = [ ":insert-output echo -n ⟩" "move_char_right" ];
        "[" = [ ":insert-output echo -n ←" "move_char_right" ];
        ";" = [ ":insert-output echo -n ⋄" "move_char_right" ];
        ":" = [ ":insert-output echo -n ·" "move_char_right" ];
        "'" = [ ":insert-output echo -n ↩" "move_char_right" ];
        "?" = [ ":insert-output echo -n ⇐" "move_char_right" ];
        space = [ ":insert-output echo -n ‿" "move_char_right" ];
        "9" = [ ":insert-output echo -n ¯" "move_char_right" ];
        "8" = [ ":insert-output echo -n ∞" "move_char_right" ];
        "p" = [ ":insert-output echo -n π" "move_char_right" ];
        # 1-Modifier
        "\"" = [ ":insert-output echo -n ˙" "move_char_right" ];
        "`" = [ ":insert-output echo -n ˜" "move_char_right" ];
        "1" = [ ":insert-output echo -n ˘" "move_char_right" ];
        "2" = [ ":insert-output echo -n ¨" "move_char_right" ];
        "4" = [ ":insert-output echo -n ⌜" "move_char_right" ];
        "3" = [ ":insert-output echo -n ⁼" "move_char_right" ];
        "5" = [ ":insert-output echo -n ´" "move_char_right" ];
        "6" = [ ":insert-output echo -n ˝" "move_char_right" ];
        # 2-Modifier
        "j" = [ ":insert-output echo -n ∘" "move_char_right" ];
        "k" = [ ":insert-output echo -n ○" "move_char_right" ];
        "h" = [ ":insert-output echo -n ⊸" "move_char_right" ];
        "l" = [ ":insert-output echo -n ⟜" "move_char_right" ];
        "K" = [ ":insert-output echo -n ⌾" "move_char_right" ];
        "%" = [ ":insert-output echo -n ⊘" "move_char_right" ];
        "$" = [ ":insert-output echo -n ◶" "move_char_right" ];
        "^" = [ ":insert-output echo -n ⎊" "move_char_right" ];
        "!" = [ ":insert-output echo -n ⎉" "move_char_right" ];
        "@" = [ ":insert-output echo -n ⚇" "move_char_right" ];
        "#" = [ ":insert-output echo -n ⍟" "move_char_right" ];
        # about block
        "w" = [ ":insert-output echo -n 𝕨" "move_char_right" ];
        "W" = [ ":insert-output echo -n 𝕎" "move_char_right" ];
        "s" = [ ":insert-output echo -n 𝕤" "move_char_right" ];
        "S" = [ ":insert-output echo -n 𝕊" "move_char_right" ];
        "x" = [ ":insert-output echo -n 𝕩" "move_char_right" ];
        "X" = [ ":insert-output echo -n 𝕏" "move_char_right" ];
        "f" = [ ":insert-output echo -n 𝕗" "move_char_right" ];
        "F" = [ ":insert-output echo -n 𝔽" "move_char_right" ];
        "g" = [ ":insert-output echo -n 𝕘" "move_char_right" ];
        "G" = [ ":insert-output echo -n 𝔾" "move_char_right" ];
        "R" = [ ":insert-output echo -n 𝕣" "move_char_right" ];
      };
    };
  };

  xdg.configFile."helix/languages.toml".source = ./languages.toml;

  xdg.configFile."helix/themes/nix-theme.toml".text = import ./theme.nix { inherit config; };
}
