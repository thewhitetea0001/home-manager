{ inputs, pkgs, lib, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
  };

  home.packages = with pkgs; [
    swaynotificationcenter
    # ---
    sherlock-launcher
    jetbrains.rider
    spicetify-cli
    brightnessctl
    virt-manager
    qbittorrent
    quickshell
    pulseaudio
    hyprpicker
    libnotify
    tailscale
    steam-run
    nwg-look
    hyprshot
    obsidian
    discord
    libvirt
    python3
    spotify
    flatpak
    gparted
    firefox
    neovim
    ranger
    evtest
    cargo
    cmake
    cairo
    wget
    btop
    tree
    qemu
    gtk4
    jdk
    zip
    gcc
    go
    gh
    # ---
  ];

  gtk.iconTheme = {
    name = "Papirus";
    package = pkgs.papirus-icon-theme;
  };

  gtk.theme = {
    name = "Adwaita-dark";
    package = pkgs.gnome-themes-extra;
  };
}
