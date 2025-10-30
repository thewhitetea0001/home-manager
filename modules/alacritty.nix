{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 10;
      colors.primary = {
        background = "#0b0b0b";
      };
    };
  };
}
