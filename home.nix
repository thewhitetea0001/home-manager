{ pkgs, ... }:
{
  home.username = "tea";
  home.homeDirectory = "/home/tea";
  home.stateVersion = "25.05";

  imports = [
    ./packages.nix
    ./modules/vim/vim.nix
    ./modules/alacritty.nix
    ./modules/hypr/hyprland.nix

    ./modules/waybar/config.nix
    ./modules/waybar/style.nix
  ];

  programs.home-manager.enable = true;
  gtk.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Breeze_Light";
    size = 24;
    package = pkgs.kdePackages.breeze;
  };
}
