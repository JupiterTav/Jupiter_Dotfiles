# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  home-manager.backupFileExtension = "backup";
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
   # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };
  services.upower.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["euler"];
  # Configure console keymap
  console.keyMap = "br-abnt2";

  users.defaultUserShell = pkgs.zsh;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.euler = {
    isNormalUser = true;
    description = "Euler";
    extraGroups = [ "networkmanager" "wheel" "gamemode"];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
      neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      wget
      firefox
      kitty
      git
      waybar
      swww
      rofi-wayland
      dunst
      libnotify
      networkmanagerapplet
      wineWowPackages.stable
      winetricks
      wineWowPackages.waylandFull
      steam
      hydralauncher
      iio-sensor-proxy
      iio-hyprland
      rofi-wayland
  ];
  programs.steam.enable = true;
  programs.gamemode.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.nix-ld.enable = true;
  programs.hyprland = {
	enable = true;
      withUWSM = true;
	xwayland.enable = true;
	};
   programs.zsh.enable = true;
   hardware = {
      graphics.enable = true;
      opengl = {
        enable = true;
    };
   };

   xdg.portal.enable = true;
   xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

   security.rtkit.enable = true;
   services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
   };	

   fonts.packages = with pkgs; [
	nerd-fonts.fira-code
	];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
   
        powerManagement.enable = true;
        services.thermald.enable = true;
        services.tlp.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;


system.stateVersion = "25.05"; # Did you read the comment?

}
