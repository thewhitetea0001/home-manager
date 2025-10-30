{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  boot.initrd.luks.devices."luks-08ad6b0b-0a5f-4f2e-befe-dbfbedc8ab5c".device = "/dev/disk/by-uuid/08ad6b0b-0a5f-4f2e-befe-dbfbedc8ab5c";
  boot.initrd.secrets = {
    "/boot/crypto_keyfile.bin" = null;
  };

  boot.loader.grub.enableCryptodisk = true;

  boot.initrd.luks.devices."luks-70c0e868-3142-4d26-b954-e7b08c043fa3".keyFile = "/boot/crypto_keyfile.bin";
  boot.initrd.luks.devices."luks-08ad6b0b-0a5f-4f2e-befe-dbfbedc8ab5c".keyFile = "/boot/crypto_keyfile.bin";
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

  services.flatpak.enable = true;
  services.xserver.libinput.enable = true;

  users.users.tea = {
    isNormalUser = true;
    description = "tea";
    extraGroups = [ "networkmanager" "wheel" "libvirt" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;
  virtualisation.libvirtd.enable = true;

  environment.systemPackages = with pkgs; [
    hyprlandPlugins.hyprspace
    ventoy-full-gtk
    home-manager
    alacritty
    hyprland
    hyprshot
    firefox
    waybar
    swww
    git
    vim
  ];

  fonts.packages = with pkgs; [
    material-design-icons
    noto-fonts
    iosevka
  ];

  programs.hyprland = {
    enable = true;
  };
  
  system.stateVersion = "25.05";
}
