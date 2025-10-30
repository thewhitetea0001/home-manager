{ config, pkgs, ... }:
{
  imports =
    [ ./hardware-configuration.nix ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Bratislava";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sk_SK.UTF-8";
    LC_IDENTIFICATION = "sk_SK.UTF-8";
    LC_MEASUREMENT = "sk_SK.UTF-8";
    LC_MONETARY = "sk_SK.UTF-8";
    LC_NAME = "sk_SK.UTF-8";
    LC_NUMERIC = "sk_SK.UTF-8";
    LC_PAPER = "sk_SK.UTF-8";
    LC_TELEPHONE = "sk_SK.UTF-8";
    LC_TIME = "sk_SK.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  programs.hyprland.enable = true;

  users.users.tea = {
    isNormalUser = true;
    description = "tea";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  nixpkgs.config.allowUnfree = true;
  
  services.udev.extraRules = ''
    ACTION=="add", ATTR{name}=="SynPS/2 Synaptics TouchPad", RUN+="/bin/sh -c 'echo 0 > /sys/class/input/%k/enabled'"
  '';

  environment.systemPackages = with pkgs; [
    home-manager
    alacritty
    hyprland
    firefox
    swww
    udev
    jdk
    vim
    git
  ];

  fonts.packages = with pkgs; [
    material-design-icons
    noto-fonts
    iosevka
  ];

  system.stateVersion = "25.05";
}
