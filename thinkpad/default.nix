# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./fonts.nix
  ];

  nixpkgs.config.allowBroken = true;

  nix = {
    # Flake Support
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";

    # Optimisations and Garbage Collection
    autoOptimiseStore = true;
    trustedUsers = [ "root" "toby" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  # Use the systemd-boot EFI boot loader.
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    zfs.enableUnstable = true;
    supportedFilesystems = [ "zfs" ];
    tmpOnTmpfs = true;
  };

  # ZFS Settings
  services.zfs.trim.enable = true;
  services.zfs.autoScrub.enable = true;

  # Hardware
  hardware.cpu.intel.updateMicrocode = true;
  hardware.opengl.driSupport32Bit = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Networking
  networking = {
    hostName = "thinkpad";
    hostId = builtins.substring 0 8 (builtins.hashString "md5" config.networking.hostName);
    networkmanager.enable = true;
    dhcpcd.enable = true;
    firewall = {
      enable = true;
    };
  };

  hardware.bluetooth.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "uk";
  };

  # Configure X
  services.xserver = {
    enable = true;
    autorun = false;
    layout = "gb";
    videoDrivers = [ "modesetting" ];
    libinput.enable = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.toby = {
    isNormalUser = true;
    home = "/home/toby";
    description = "Toby Rea";
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
      "input"
      "docker"
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    imv
    neovim 
    wget
    pavucontrol

    mullvad-vpn
    transmission

    # Embedded Systems
    pulseview
    arduino

    signal-desktop

    # VSCode
    libsecret

    # Laravel stuff
    php80
    php80Packages.composer
    docker-compose
    nodejs
  ];

  services.mullvad-vpn.enable = true;
  networking.firewall.checkReversePath = "loose";
  networking.wireguard.enable = true;
  
  # VSCode fix
  services.gnome.gnome-keyring.enable = true;

  # Laravel
  virtualisation.docker.enable = true;

  system.stateVersion = "21.05";
}

